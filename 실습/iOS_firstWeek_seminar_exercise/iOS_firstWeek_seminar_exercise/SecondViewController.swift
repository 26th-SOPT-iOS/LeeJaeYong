//
//  SecondViewController.swift
//  iOS_firstWeek_seminar_exercise
//
//  Created by 이재용 on 2020/04/19.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var frequency: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
        
    }
    
    @IBAction func dismissPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setLabel() {
        guard let name = self.name else { return }
        guard let email = self.email else { return }
        guard let isOnOff = self.isOnOff else { return }
        guard let frequency = self.frequency else { return }
        
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnOff ? "On": "Off"
        frequencyLabel.text = "\(frequency)"
    }
}
