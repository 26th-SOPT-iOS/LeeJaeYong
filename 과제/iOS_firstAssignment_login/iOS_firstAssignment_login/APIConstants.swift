//
//  APIConstants.swift
//  iOS_firstAssignment_login
//
//  Created by 이재용 on 2020/05/16.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
}
