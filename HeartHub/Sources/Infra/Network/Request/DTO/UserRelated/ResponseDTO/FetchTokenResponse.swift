//
//  FetchTokenResponse.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/19.
//

import Foundation

struct FetchTokenResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let data: Token
}
