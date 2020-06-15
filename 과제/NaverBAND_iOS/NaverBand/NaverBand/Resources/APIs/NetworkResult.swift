//
//  NetworkResult.swift
//  iOS_secondAssignment
//
//  Created by 이재용 on 2020/05/22.
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
