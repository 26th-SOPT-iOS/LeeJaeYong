//
//  RecommendPage.swift
//  NaverBand
//
//  Created by 이재용 on 2020/06/10.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation

// MARK: - RecommendPageData
struct RecommendPageData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [RPage]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([RPage].self, forKey: .data)) ?? nil
    }
    
}

// MARK: - RPage
struct RPage: Codable {
    let pageName, pageDetail: String
    let pageImg: String

    enum CodingKeys: String, CodingKey {
        case pageName = "page_name"
        case pageDetail = "page_detail"
        case pageImg = "page_img"
    }
}
