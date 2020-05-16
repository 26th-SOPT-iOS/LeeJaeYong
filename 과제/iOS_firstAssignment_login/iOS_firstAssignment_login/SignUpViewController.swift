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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signupBtnPressed(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passwordTextField.text else { return }
        guard let inputNAME = nameTextField.text else {
            return
        }
        guard let inputEMAIL = emailTextField.text else {
            return
        }
        guard let inputPHONE = phoneTextField.text else {
            return
        }
        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE) { networkResult in
            switch networkResult {
            case .success:
                print("\(inputID)")
                print("\(inputPWD)")
            case .requestErr(let message):
                    guard let message = message as? String else { return }
                    let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alertViewController.addAction(action)
                    self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr") case .networkFail: print("networkFail") }
        }
    }
    
}
