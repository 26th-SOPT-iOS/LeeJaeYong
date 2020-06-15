//
//  SearchViewController.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/25.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var subjectSearchBtns: [UIButton]!
    @IBOutlet weak var newBandCollectionView: UICollectionView!
    @IBOutlet weak var recommendPageCollectionView: UICollectionView!
    @IBOutlet weak var recommendBandCollectionView: UICollectionView!
    
    var newBandList: [NBand] = []
    var recommendPageList: [RPage] = []
    var recommendBandList: [RBand] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtns()
        setDatas()
        newBandCollectionView.delegate = self
        newBandCollectionView.dataSource = self
        recommendPageCollectionView.delegate = self
        recommendPageCollectionView.dataSource = self
        recommendBandCollectionView.delegate = self
        recommendBandCollectionView.dataSource = self
    }
    
    // new band datas
    private func setDatas() -> Void {
        
        NewBandService.shared.getNewBand { (networkResult) in
            switch networkResult {
            case .success(let data):
                guard let dt = data as? [NBand] else {
                    return
                }
                print(dt)
                self.newBandList = dt
                self.newBandCollectionView.reloadData()
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "통신 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
        
        RecommendBandService.shared.getRecommendBand { (networkResult) in
            switch networkResult {
            case .success(let data):
                guard let dt = data as? [RBand] else {
                    return
                }
                print(dt)
                self.recommendBandList = dt
                self.recommendBandCollectionView.reloadData()
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "통신 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
        
        RecommendPageService.shared.getRecommendPage { (networkResult) in
            switch networkResult {
            case .success(let data):
                guard let dt = data as? [RPage] else {
                    return
                }
                print(dt)
                self.recommendPageList = dt
                self.recommendPageCollectionView.reloadData()
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "통신 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
    // Btn settings
    private func setBtns() -> Void {
        for btn in subjectSearchBtns {
            btn.backgroundColor = .naver
            //btn.titleLabel?.font = UIFont(name: "NotoSansCJKkr-Bold", size: 12.0)
            // Zeplin과 다른 부분
            btn.layer.cornerRadius = 14
            
        }
    }
}
//MARK: - DataSource
extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == newBandCollectionView {
            return newBandList.count
        } else if collectionView == recommendPageCollectionView {
            return recommendPageList.count
        } else {
            return recommendBandList.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newBandCollectionView {
            guard let newBandCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewBandCell.identifier, for: indexPath) as? NewBandCell else { return UICollectionViewCell() }
            newBandCell.set(newBandList[indexPath.row])
            return newBandCell
        } else if collectionView == recommendPageCollectionView {
            guard let recommendPageCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendPageCell.identifier, for: indexPath) as? RecommendPageCell else { return UICollectionViewCell() }
            recommendPageCell.set(recommendPageList[indexPath.row])
            return recommendPageCell
        } else {
            guard let recommendBandCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendBandCell.identifier, for: indexPath) as? RecommendBandCell else { return UICollectionViewCell() }
            recommendBandCell.set(recommendBandList[indexPath.row])
            return recommendBandCell
        }
    }
    
}

//MARK: - DelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        if collectionView == newBandCollectionView {
            //return CGSize(width: 147, height: 48)
            return CGSize(width: (collectionView.frame.width - 70) / 2, height: (collectionView.frame.height - 12)/2)
        } else if collectionView == recommendPageCollectionView {
            //return CGSize(width: 270, height: 60)
            return CGSize(width: (collectionView.frame.width - 44), height: (collectionView.frame.height - 52)/3)
        } else {
            //return CGSize(width: 254, height: 151)
            return CGSize(width: (collectionView.frame.width - 120), height: (collectionView.frame.height))
        }
        
    }
    
    // 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        
    }
    // 좌,우
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        if collectionView == newBandCollectionView {
//            return 10
//        } else if collectionView == recommendPageCollectionView {
//            return 10
//        } else {
//            return 10
//        }
//
//    }
//    // 위 아래
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        if collectionView == newBandCollectionView {
//            return 12
//        } else if collectionView == recommendPageCollectionView {
//            return 26
//        } else {
//            return 0
//        }
//    }
    
}
