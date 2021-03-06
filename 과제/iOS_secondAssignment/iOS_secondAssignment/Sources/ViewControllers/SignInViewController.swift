//
//  ViewController.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/04/27.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit
import BEMCheckBox

class SignInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var myCheckBox: BEMCheckBox!
    
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
        
        self.myCheckBox.onAnimationType = .bounce
        self.myCheckBox.offAnimationType = .bounce
        myCheckBox.delegate = self
        // textfield 및 button 둥글게 만들기 속성
        idTextField.layer.cornerRadius = 22
        passwordTextField.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 24
        
        guard let id = UserDefaults.standard.string(forKey: "id") else { return }
        guard let password = UserDefaults.standard.string(forKey: "pwd") else { return }
        
        LoginService.shared.login(id: id, pwd: password) { networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabBarController = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else {
                    return
                }
                tabBarController.modalPresentationStyle = .fullScreen
                self.present(tabBarController, animated: true, completion: nil)
                
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
    
    @IBAction func signinBtnPressed(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passwordTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
                
            case .success(let token):
                // autoLogin 구현
                self.isAutoLoginOn(id: inputID, pwd: inputPWD)
                
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabBarController = self.storyboard?.instantiateViewController(identifier: "TabBarController") as? UITabBarController else {
                    return
                }
                tabBarController.modalPresentationStyle = .fullScreen
                self.present(tabBarController, animated: true, completion: nil)
                
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
    
    private func isAutoLoginOn(id: String, pwd: String) -> Void {
        
        if self.myCheckBox.on {
            UserDefaults.standard.set(id, forKey: "id")
            UserDefaults.standard.set(pwd, forKey: "pwd")
        }
    }
}

extension SignInViewController: BEMCheckBoxDelegate {
    func didTap(_ checkBox: BEMCheckBox) {
        print("did Tap")
    }
}

