//
//  Music.swift
//  iOS_thirdWeek_seminar_exercise
//
//  Created by 이재용 on 2020/05/09.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

// Music 모델입니다.
// 멤버 변수가 총 세 개인 Music 구조체를 생성했습니다.

struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(coverName: String, musicTitle: String, singer: String) {
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = musicTitle
        self.singer = singer
    }
}

