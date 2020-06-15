//
//  RecommendBand.swift
//  NaverBand
//
//  Created by 이재용 on 2020/06/10.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation

import Foundation

// MARK: - RecommendBandData
struct RecommendBandData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [RBand]?
    
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
        data = (try? values.decode([RBand].self, forKey: .data)) ?? nil
    }
}

// MARK: - Datum
struct RBand: Codable {
    let bandName, bandNumOfMember: String
    let bandImg: String
    let userNickname: String

    enum CodingKeys: String, CodingKey {
        case bandName = "band_name"
        case bandNumOfMember = "band_num_of_member"
        case bandImg = "band_img"
        case userNickname = "user_nickname"
    }
}
