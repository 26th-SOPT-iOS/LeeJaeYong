//
//  APIConstants.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/05/22.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://52.79.107.126:3000"
    
    static let newBandURL = APIConstants.baseURL + "/newBand"
    static let recommendPageURL = APIConstants.baseURL + "/recommendPage"
    static let recommendBandURL = APIConstants.baseURL + "/recommendBand"
    static let newNoticeURL = APIConstants.baseURL + "/newNotice"
}
