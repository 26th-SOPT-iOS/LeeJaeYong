//
//  FriendTableViewCell.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/05/14.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    static let identifier: String = "FriendTableViewCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var heightConstraintOfImage: NSLayoutConstraint!
    @IBOutlet weak var widthConstraintOfImage: NSLayoutConstraint!
    @IBOutlet weak var outStackView: UIStackView!
    @IBOutlet weak var topConstraintOfOutStackView: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setFriendInfo(person: PersonInfo) {
        profileImage.image = UIImage(named: person.imageName)
        nameLabel.text = person.name
        introduceLabel.text = person.introduce
    }
    
}
