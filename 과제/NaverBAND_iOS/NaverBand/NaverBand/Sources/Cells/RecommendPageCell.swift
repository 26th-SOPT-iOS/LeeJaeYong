//
//  RecommentPageCell.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/29.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class RecommendPageCell: UICollectionViewCell {
    static let identifier: String = "RecommendPageCell"
    
    @IBOutlet weak var recommendImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func set(_ recommendPage: RPage) -> Void {
        
        let url = URL(string: recommendPage.pageImg)
        self.recommendImg.kf.setImage(with: url)
        nameLabel.text = recommendPage.pageName
        detailLabel.text = recommendPage.pageDetail

    }
    
}
