//
//  ViewController.swift
//  iOS_firstAssignment_login
//
//  Created by 이재용 on 2020/04/22.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        // textfield 초기화
//        self.idTextField.text = ""
//        self.passwordTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 5
        signupButton.layer.cornerRadius = 5
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passwordTextField.text else { return }
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                print(token)
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let CompleteViewController = self.storyboard?.instantiateViewController(identifier:
                    "CompleteViewController") as? CompleteViewController else { return }
                CompleteViewController.modalPresentationStyle = .fullScreen
                
                self.present(CompleteViewController, animated: true, completion: nil) case .requestErr(let message):
                    guard let message = message as? String else { return }
                    let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alertViewController.addAction(action)
                    self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr") case .networkFail: print("networkFail") }
        }
    }
    
}

