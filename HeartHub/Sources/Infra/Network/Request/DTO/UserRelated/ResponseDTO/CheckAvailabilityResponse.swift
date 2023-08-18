//
//  CheckAvailabilityResponseDTO.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/17.
//

import Foundation

struct CheckAvailabilityResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let data: Bool
}
