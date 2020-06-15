//
//  NewNotice.swift
//  NaverBand
//
//  Created by 이재용 on 2020/06/10.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation

// MARK: - NewNoticeData
struct NewNoticeData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [NNotice]?
}

// MARK: - Datum
struct NNotice: Codable {
    let noticeTitle, noticeSub: String
    let noticeThumbnail: String

    enum CodingKeys: String, CodingKey {
        case noticeTitle = "notice_title"
        case noticeSub = "notice_sub"
        case noticeThumbnail = "notice_thumbnail"
    }
}
