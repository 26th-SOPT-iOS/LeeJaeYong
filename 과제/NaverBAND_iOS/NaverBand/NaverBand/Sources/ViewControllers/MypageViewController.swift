//
//  MypageViewController.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/25.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    var newsList: [NNotice] = []
    @IBOutlet weak var lineView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatas()
        
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        
    }
    
    private func setDatas() -> Void {
        NewNoticeService.shared.getNewNotice { (networkResult) in
            switch networkResult {
            case .success(let data):
                guard let dt = data as? [NNotice] else {
                    return
                }
                print(dt)
                
                self.newsList = dt
                self.newsCollectionView.reloadData()
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
//        let news1 = News(imgName: "icPhoto1", name: "순위로 보는 요즘 핫한 맛집과 카페", detail: "내마음속에 저장각!")
//        let news2 = News(imgName: "icPhoto2", name: "바름이의 힐링되는 미소", detail: "귀엽고 깜찍한 무료 스티커가 잔뜩~")
//        let news3 = News(imgName: "icPhoto3", name: "생일날은 케익은 필수", detail: "더 맛있는 부드러운 치즈케이크")
//
//        newsList = [news1, news2, news3]
    }
}
//MARK: - DataSource
extension MypageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let newsCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else { return UICollectionViewCell() }
        newsCell.set(newsList[indexPath.row])
        return newsCell
    }
    
}

//MARK: - DelegateFlowLayout
extension MypageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: 355, height: 60)
        }
    
    // 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 31, bottom: 0, right: 0)
        
    }

    // 위 아래
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 43
        
    }

    // 좌,우
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
