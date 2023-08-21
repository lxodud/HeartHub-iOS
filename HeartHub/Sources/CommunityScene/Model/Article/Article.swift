//
//  Article.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/19.
//

import Foundation

struct Article: Decodable {
    let articleID: Int
    let content: String
    let goodStatus: Bool?
    let heartStatus: Bool?
    let theme: String
    let username: String
    let userID: Int
    let communityImageUrl: [String]
    
    enum CodingKeys: String, CodingKey {
        case articleID = "boardId"
        case content
        case goodStatus
        case heartStatus
        case theme
        case username = "userName"
        case userID = "userId"
        case communityImageUrl = "communityImgUrl"
    }
}
