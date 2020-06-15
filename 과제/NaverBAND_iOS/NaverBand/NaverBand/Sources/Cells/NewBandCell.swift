//
//  BandCell.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/27.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit
import Kingfisher

class NewBandCell: UICollectionViewCell {
    static let identifier: String = "NewBandCell"
    @IBOutlet weak var bandImageView: UIImageView!
    @IBOutlet weak var bandLabel: UILabel!
    
    func set(_ bandInformation: NBand) {
        
        let url = URL(string: bandInformation.bandImg)
        self.bandImageView.kf.setImage(with: url)
        self.bandLabel.text = bandInformation.bandName
    }
}
