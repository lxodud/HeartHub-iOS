//
//  SetMateRequestDTO.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/13.
//

import Foundation

struct SetMateRequestDTO: Encodable {
    let currentUsername: String
    let mateName: String
}
