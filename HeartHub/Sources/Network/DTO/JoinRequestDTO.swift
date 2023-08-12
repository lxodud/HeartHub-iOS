//
//  JoinRequestDTO.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/13.
//

import Foundation

struct JoinRequestDTO: Encodable {
    let userName: String
    let password: String
    let gender: String
    let email: String
    let nickName: String
    let marketingStatus: String
    let mate: String
    let datingDate: String
    let birth: String
    
    private enum CodingKeys: String, CodingKey {
        case userName = "username"
        case password = "password"
        case gender = "gender"
        case email = "email"
        case nickName = "nickname"
        case marketingStatus = "marketingStatus"
        case mate = "mate"
        case datingDate = "datingDate"
        case birth = "birth"
    }
}
