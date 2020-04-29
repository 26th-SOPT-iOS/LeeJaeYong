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
    

    @IBAction func backBtnPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        guard let completeVC = self.storyboard?.instantiateViewController(identifier: "CompleteViewController") as? CompleteViewController else { return }
        
        completeVC.modalPresentationStyle = .fullScreen
        self.present(completeVC, animated: true) {
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }
    }
    

}
