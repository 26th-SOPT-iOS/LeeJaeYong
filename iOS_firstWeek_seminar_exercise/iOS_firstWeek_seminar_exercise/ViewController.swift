//
//  ViewController.swift
//  iOS_firstWeek_seminar_exercise
//
//  Created by 이재용 on 2020/04/19.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sampleSwitch: UISwitch!
    @IBOutlet weak var sampleSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func transferData(_ sender: UIButton) {
        guard let secondVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }
        
        secondVC.name = nameTextField.text
        secondVC.email = emailTextField.text
        secondVC.isOnOff = sampleSwitch.isOn
        secondVC.frequency = sampleSlider.value
        self.present(secondVC, animated: true, completion: nil)
    }
    
}

