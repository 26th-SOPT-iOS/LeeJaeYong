//
//  FriendInformation.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/05/12.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

struct PersonInfo {
    var imageName: String
    var name: String
    var introduce: String
    
    init(imageName: String, name: String, introduce: String) {
        self.imageName = imageName
        self.name = name
        self.introduce = introduce
    }
}
