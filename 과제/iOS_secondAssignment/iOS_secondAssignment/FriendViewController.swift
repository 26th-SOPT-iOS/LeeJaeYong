//
//  FriendViewController.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/05/12.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    
    @IBOutlet weak var friendTableView: UITableView!
    
    var friendInfos: [PersonInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendTableView.delegate = self
        friendTableView.dataSource = self
        setFriendInformations()
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
    }
    
    private func setFriendInformations() {
        let me = PersonInfo(imageName: "profile1Img", name: "이재용", introduce: "나무실상묘법연화경 관세음보살보문품")
        
        let friend1 = PersonInfo(imageName: "profile2Img", name: "이솝트", introduce: "월왈왈왈왈왈올아롱오올아")
        let friend2 = PersonInfo(imageName: "profile3Img", name: "이솝트", introduce: "컹컹")
        let friend3 = PersonInfo(imageName: "profile4Img", name: "이솝트", introduce: "이")
        let friend4 = PersonInfo(imageName: "profile5Img", name: "이솝트", introduce: "월왈왈ㅁㄴㅇㄹ왈왈왈올아롱오올아")
        let friend5 = PersonInfo(imageName: "profile6Img", name: "이솝트", introduce: "월왈왈왈왈왈올아롱오올아")
        let friend6 = PersonInfo(imageName: "profile7Img", name: "이솝트", introduce: "월왈왈롱오올아")
        let friend7 = PersonInfo(imageName: "profile8Img", name: "이솝트", introduce: "")
        let friend8 = PersonInfo(imageName: "profile9Img", name: "이솝트", introduce: "ㅠㅠ")
        let friend9 = PersonInfo(imageName: "profile2Img", name: "이솝트", introduce: "월왈왈왈왈왈올아롱오올아")
        let friend10 = PersonInfo(imageName: "profile3Img", name: "이솝트", introduce: "abcdefg")
        let friend11 = PersonInfo(imageName: "profile4Img", name: "이솝트", introduce: "")
        let friend12 = PersonInfo(imageName: "profile5Img", name: "이솝트", introduce: "월왈왈왈왈왈올아롱오올아")
        let friend13 = PersonInfo(imageName: "profile6Img", name: "이솝트", introduce: "")
        let friend14 = PersonInfo(imageName: "profile7Img", name: "이솝트", introduce: "")
        let friend15 = PersonInfo(imageName: "profile8Img", name: "이솝트", introduce: "")
        let friend16 = PersonInfo(imageName: "profile9Img", name: "이솝트", introduce: "")
        let friend17 = PersonInfo(imageName: "profile7Img", name: "이솝트", introduce: "")
        let friend18 = PersonInfo(imageName: "profile8Img", name: "이솝트", introduce: "")
        let friend19 = PersonInfo(imageName: "profile9Img", name: "이솝트", introduce: "")
        friendInfos = [me, friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8, friend9, friend10, friend11, friend12, friend13, friend14, friend15, friend16, friend17, friend18, friend19]
    }
    
    @IBAction func setBtnPressed(_ sender: Any) {
        let actionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        let friendControl = UIAlertAction(title: "친구 관리", style: .default) { (action) in
            // 눌렀을 때 행동
        }
        let allSet = UIAlertAction(title: "전체 설정", style: .default) { (action) in
            // 눌렀을 때 행동
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        actionSheet.addAction(friendControl)
        actionSheet.addAction(allSet)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true) {
            actionSheet.view.superview?.isUserInteractionEnabled = true
            actionSheet.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        }
    }
    
    @objc func alertControllerBackgroundTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}


//MARK: - tableViewDelegate,Datasource
extension FriendViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return 100
        } else {
            return 62
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 35
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return friendInfos.count - 1
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        if section == 1 {
            let friendCountLabel = UILabel()
            friendCountLabel.text = "친구 \(self.friendInfos.count - 1)"
            friendCountLabel.textColor = .systemGray2
            friendCountLabel.frame = CGRect.init(x: 16, y: 0, width: 35, height: 17)
            friendCountLabel.font = UIFont.systemFont(ofSize: 12)
            headerView.addSubview(friendCountLabel)
            
            friendCountLabel.translatesAutoresizingMaskIntoConstraints = false
            let constraintX = NSLayoutConstraint.init(item: friendCountLabel,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: headerView,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 16)
            let constraintY = NSLayoutConstraint.init(item: friendCountLabel,
                                                      attribute: .centerY,
                                                      relatedBy: .equal,
                                                      toItem: headerView,
                                                      attribute: .centerY,
                                                      multiplier: 1.0,
                                                      constant: 0)
            
            NSLayoutConstraint.activate([constraintX, constraintY])
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = friendTableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        if indexPath.row == 0 && indexPath.section == 0 {
            
            friendCell.heightConstraintOfImage.constant = 60
            friendCell.widthConstraintOfImage.constant = 60
            friendCell.profileImage.contentMode = .scaleAspectFill
            friendCell.nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
            friendCell.outStackView.spacing = 13
            friendCell.topConstraintOfOutStackView.constant = 15
            friendCell.setFriendInfo(person: friendInfos[indexPath.row])
            
            // line
            let separatorView = UIView.init(frame: CGRect(x: 15, y: friendCell.frame.size.height - 1, width: friendCell.frame.size.width - 30, height: 1))
            separatorView.backgroundColor = .systemGray2
            friendCell.contentView.addSubview(separatorView)
            
            return friendCell
        } else {
            
            friendCell.heightConstraintOfImage.constant = 50
            friendCell.widthConstraintOfImage.constant = 50
            friendCell.profileImage.contentMode = .scaleAspectFill
            friendCell.nameLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
            friendCell.outStackView.spacing = 22
            friendCell.topConstraintOfOutStackView.constant = 6
            
            friendCell.setFriendInfo(person: friendInfos[indexPath.row + 1])
            
            return friendCell
        }
    }
    
    //MARK: - For slide and delete motion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && indexPath.section != 0 {
            friendInfos.remove(at: indexPath.row + 1)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }
}
