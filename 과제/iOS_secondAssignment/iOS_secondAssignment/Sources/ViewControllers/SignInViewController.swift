//
//  ViewController.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/04/27.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textfield 및 button 둥글게 만들기 속성
        idTextField.layer.cornerRadius = 22
        passwordTextField.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 24
        
        
    }

    @IBAction func signInBtnPressed(_ sender: UIButton) {

        guard let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else { return }
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
    }
    
}

