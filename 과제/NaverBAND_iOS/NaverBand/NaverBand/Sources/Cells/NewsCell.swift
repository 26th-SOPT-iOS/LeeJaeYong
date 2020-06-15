//
//  NewsCell.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/29.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    static let identifier: String = "NewsCell"
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsNameLabel: UILabel!
    @IBOutlet weak var newsDetailLabel: UILabel!
    
    func set(_ news: NNotice) {
        
        let url = URL(string: news.noticeThumbnail)
        self.newsImageView.kf.setImage(with: url)
        newsNameLabel.text = news.noticeTitle
        newsDetailLabel.text = news.noticeSub
    }
}
