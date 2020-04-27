//
//  CompleteViewController.swift
//  iOS_firstAssignment_login
//
//  Created by 이재용 on 2020/04/22.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var id: String?
    var pwd: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginComplete()
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func loginComplete() {
        guard let id = self.id else { return } // guard는 false일 경우 else 안의 코드가 실행된다.
        guard let pwd = self.pwd else { return }
        
        idLabel.text = id
        passwordLabel.text = pwd
        
    }

}
