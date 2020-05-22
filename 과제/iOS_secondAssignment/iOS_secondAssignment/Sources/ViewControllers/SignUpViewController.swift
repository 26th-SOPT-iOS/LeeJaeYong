//
//  SignUpViewController.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/04/28.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: FormTextField!
    @IBOutlet weak var idTextField: FormTextField!
    @IBOutlet weak var passwordTextField: FormTextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backItem?.title = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.layer.cornerRadius = 22
        idTextField.layer.cornerRadius = 22
        passwordTextField.layer.cornerRadius = 22
        signUpButton.layer.cornerRadius = 24
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        guard let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else { return }
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true) {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }
    }
    
    
}
