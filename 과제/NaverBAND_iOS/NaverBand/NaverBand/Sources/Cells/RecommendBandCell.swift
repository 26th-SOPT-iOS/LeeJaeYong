//
//  RecommendBandCell.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/29.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class RecommendBandCell: UICollectionViewCell {
    static let identifier: String = "RecommendBandCell"
    
    @IBOutlet weak var bandNameLabel: UILabel!
    @IBOutlet weak var bandImageView: UIImageView!
    @IBOutlet weak var bandDetailLabel: UILabel!
    
    func set(_ band: RBand) {
        bandNameLabel.text = band.bandName
        
        let url = URL(string: band.bandImg)
        self.bandImageView.kf.setImage(with: url)
        
        bandDetailLabel.text = "멤버 \(band.bandNumOfMember) | \(band.userNickname)"
        
    }
}
