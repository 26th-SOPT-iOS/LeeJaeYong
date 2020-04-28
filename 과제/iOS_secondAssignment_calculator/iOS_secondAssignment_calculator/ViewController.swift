//
//  ViewController.swift
//  iOS_secondAssignment_calculator
//
//  Created by 이재용 on 2020/04/27.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        oneButton.layer.cornerRadius =  oneButton.bounds.size.width * 0.5
        twoButton.layer.cornerRadius =  twoButton.bounds.size.width * 0.5
        threeButton.layer.cornerRadius = threeButton.bounds.size.width * 0.5
        fourButton.layer.cornerRadius = fourButton.frame.size.width * 0.5
        fiveButton.layer.cornerRadius = fiveButton.bounds.size.width / 2
        sixButton.layer.cornerRadius = sixButton.frame.size.width / 2
        sevenButton.layer.cornerRadius = sevenButton.bounds.size.width / 2
        eightButton.layer.cornerRadius = twoButton.bounds.size.width / 2
        nineButton.layer.cornerRadius = nineButton.bounds.size.width / 2
        zeroButton.layer.cornerRadius = zeroButton.bounds.size.width / 2
        divisionButton.layer.cornerRadius = divisionButton.bounds.size.width / 2
        multiplyButton.layer.cornerRadius = multiplyButton.bounds.size.width / 2
        minusButton.layer.cornerRadius = minusButton.bounds.size.width / 2
        resultButton.layer.cornerRadius = resultButton.bounds.size.width / 2
        plusButton.layer.cornerRadius = plusButton.bounds.size.width / 2
        clearButton.layer.cornerRadius = clearButton.bounds.size.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(oneButton.frame.size.width)
        print(oneButton.frame.size.height)
    }


}

