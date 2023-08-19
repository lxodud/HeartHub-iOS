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
    let goodStatus: Bool
    let heartStatus: Bool
    let theme: String
    let username: String
    let communityImageUrl: [String]
    
    enum CodingKeys: String, CodingKey {
        case articleID
        case content
        case goodStatus
        case heartStatus
        case theme
        case username = "userName"
        case communityImageUrl = "communityImgUrl"
    }
}
