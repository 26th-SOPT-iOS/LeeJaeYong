//
//  TabBarViewController.swift
//  NaverBand
//
//  Created by 이재용 on 2020/06/10.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setTabBar()
        
    }
    
    func setTabBar() {
        // 1
        let OneStoryboard = UIStoryboard.init(name: "One", bundle: nil)
        guard let firstTab = OneStoryboard.instantiateViewController(identifier: "OneViewController")
            as? OneViewController  else {
            return
        }
        firstTab.tabBarItem.title = "Home"
        firstTab.tabBarItem.image = UIImage(named: "icTabHome")
        firstTab.tabBarItem.selectedImage = UIImage(named: "icSelectedHome")

        // 2
        let TwoStoryboard = UIStoryboard.init(name: "Two", bundle: nil)
        guard let secondTab = TwoStoryboard.instantiateViewController(identifier: "TwoViewController")
            as? TwoViewController  else {
            return
        }
        secondTab.tabBarItem.title = "New"
        secondTab.tabBarItem.image = UIImage(named: "icTabNew")
        secondTab.tabBarItem.selectedImage = UIImage(named: "icSelectedNew")

        // 3
        let SearchStoryboard = UIStoryboard.init(name: "Search", bundle: nil)
        guard let searchTab = SearchStoryboard.instantiateViewController(identifier: "SearchViewController")
            as? SearchViewController  else {
            return
        }
        searchTab.tabBarItem.title = "Search"
        searchTab.tabBarItem.image = UIImage(named: "icTabSearch")
        searchTab.tabBarItem.selectedImage = UIImage(named: "icSelectedSearch")

        // 4
        let FourStoryboard = UIStoryboard.init(name: "Four", bundle: nil)
        guard let fourthTab = FourStoryboard.instantiateViewController(identifier: "FourViewController")
            as? FourViewController  else {
            return
        }
        fourthTab.tabBarItem.title = "Chat"
        fourthTab.tabBarItem.image = UIImage(named: "icTabChat")
        fourthTab.tabBarItem.selectedImage = UIImage(named: "icSelectedChat")

        // 5
        let MypageStoryboard = UIStoryboard.init(name: "Mypage", bundle: nil)
        guard let mypageTab = MypageStoryboard.instantiateViewController(identifier: "MypageViewController")
            as? MypageViewController  else {
            return
        }
        mypageTab.tabBarItem.title = "Mypage"
        mypageTab.tabBarItem.image = UIImage(named: "icTabMypage")
        mypageTab.tabBarItem.selectedImage = UIImage(named: "icSelectedMypage")

        let tabs =  [firstTab, secondTab, searchTab, fourthTab, mypageTab]
        self.setViewControllers(tabs, animated: false)
    }

}
