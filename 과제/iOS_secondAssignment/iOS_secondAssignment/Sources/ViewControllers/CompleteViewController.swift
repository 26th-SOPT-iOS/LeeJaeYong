//
//  CompleteViewController.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/04/28.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    @IBOutlet weak var soptImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var heightLayout: NSLayoutConstraint!
    
    var id: String?
    var password: String?

    let minHeight: CGFloat = 140
    var soptImageHeightConstant: CGFloat = 210
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        soptImageHeightConstant = soptImage.frame.height
        
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: tabBarController!.tabBar.frame.height + 15.0, right: 0.0)
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "pwd")
        guard let FirstNavigationController = self.storyboard?.instantiateViewController(identifier: "FirstNavigationController") as? UINavigationController else { return }
        FirstNavigationController.modalPresentationStyle = .fullScreen
        self.present(FirstNavigationController, animated: false, completion: nil)
    }
    
}


//MARK: - UIScrollViewDelegate
extension CompleteViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewOffSet = scrollView.contentOffset.y // 음수
//        print(scrollViewOffSet)
        if scrollViewOffSet < 0.0 {
            heightLayout.constant = soptImageHeightConstant - scrollViewOffSet
        } else {
            let newHeight: CGFloat = soptImageHeightConstant - scrollViewOffSet > minHeight ? soptImageHeightConstant - scrollViewOffSet : minHeight
            heightLayout.constant = newHeight
        }
    }
}

