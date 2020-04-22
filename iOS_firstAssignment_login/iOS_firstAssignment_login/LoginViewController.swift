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
     
        // textfield 초기화
        self.idTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 5
        signupButton.layer.cornerRadius = 5
    }

    @IBAction func loginPressed(_ sender: Any) {
        if idTextField.text == "" || passwordTextField.text == "" {
            print("아이디 또는 비밀번호를 채워주세요.")
            alert()
        } else {
            guard let completeViewController = self.storyboard?.instantiateViewController(identifier: "CompleteViewController") as? CompleteViewController else { return }
            
            completeViewController.id = idTextField.text
            completeViewController.pwd = passwordTextField.text
            
            completeViewController.modalPresentationStyle = .fullScreen // 다음 화면 전체화면 만들기
            self.present(completeViewController, animated: true, completion: {
            })
        }// 화면 전환
    }
    func alert() {
        let dialog = UIAlertController(title: "로그인 오류", message: "아이디 또는 비밀번호를 채워주세요.", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        dialog.addAction(action)
        self.present(dialog, animated: true, completion: nil)
    }
    
}

