//
//  SignUpViewController.swift
//  iOS_firstAssignment_login
//
//  Created by 이재용 on 2020/04/22.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signupPressed(_ sender: Any) {
        guard let completeViewController = self.storyboard?.instantiateViewController(identifier: "CompleteViewController") as? CompleteViewController else { return }
        completeViewController.id = idTextField.text
        completeViewController.pwd = passwordTextField.text
        
        completeViewController.modalPresentationStyle = .fullScreen // 전체 화면 만드는 property
        self.present(completeViewController, animated: true, completion: {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            } // 네비게이션컨트롤러 = 그릇
        }) // 화면 전환
    }

}
