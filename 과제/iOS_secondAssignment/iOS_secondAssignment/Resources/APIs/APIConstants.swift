//
//  APIConstants.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/05/22.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.144.115:3002"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
    static let profileURL = APIConstants.baseURL + "/user/profile"
}
