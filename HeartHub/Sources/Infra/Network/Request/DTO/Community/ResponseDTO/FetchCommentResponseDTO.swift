//
//  FetchCommentResponseDTO.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/20.
//

import Foundation

struct FetchCommentResponseDTO {
    let isSuccess: Bool
    let code: Int
    let message: String
    let data: [Comment]
}