//
//  SignUpViewController.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/04/28.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var idTextField: FormTextField!
    @IBOutlet weak var passwordTextField: FormTextField!
    @IBOutlet weak var nameTextField: FormTextField!
    @IBOutlet weak var emailTextField: FormTextField!
    @IBOutlet weak var phoneTextField: FormTextField!
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
        emailTextField.layer.cornerRadius = 22
        phoneTextField.layer.cornerRadius = 22
        signUpButton.layer.cornerRadius = 24
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passwordTextField.text else { return }
        guard let inputNAME = nameTextField.text else { return }
        guard let inputEMAIL = emailTextField.text  else { return }
        guard let inputPHONE = phoneTextField.text else { return }
        
        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE) { networkResult in
            switch networkResult {
            case .success(let message):
                print(message)
                
                // autologin 구현
                self.setAutoLogin(id: inputID, pwd: inputPWD)
                
                guard let signInViewController = self.storyboard?.instantiateViewController(identifier: "SignInViewController") as? SignInViewController else {
                    return
                }
                signInViewController.modalPresentationStyle = .fullScreen
                self.present(signInViewController, animated: true, completion: nil)
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
    
    private func setAutoLogin(id: String, pwd: String) -> Void {
        UserDefaults.standard.set(id, forKey: "id")
        UserDefaults.standard.set(pwd, forKey: "pwd")
    }
    
}
