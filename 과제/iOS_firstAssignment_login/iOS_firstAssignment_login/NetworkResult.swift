//
//  NetworkResult.swift
//  iOS_firstAssignment_login
//
//  Created by 이재용 on 2020/05/16.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
