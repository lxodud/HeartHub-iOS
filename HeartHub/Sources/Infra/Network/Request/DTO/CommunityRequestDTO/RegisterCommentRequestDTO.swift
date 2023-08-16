//
//  RegisterCommentRequestDTO.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/16.
//

import Foundation

struct RegisterCommentRequestDTO: Encodable {
    let articleID: Int
    let username: String
    let conetent: String
    let parentID: Int
    
    private enum CodingKeys: String, CodingKey {
        case articleID = "boardId"
        case username = "userName"
        case conetent
        case parentID = "parentId"
    }
}
