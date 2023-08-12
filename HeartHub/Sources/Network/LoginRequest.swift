//
//  LoginEndpoint.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/12.
//

import Foundation

struct LoginRequest {
    static func makeEmailCheckRequest(of email: String) -> Requestable {
        return Request(
            path: "api/check/email/" + email
        )
    }
    
    static func makeIdCheckApiRequest(of id: String) -> Requestable {
        return Request(
            path: "api/check/username/" + id
        )
    }
    
    static func makeVerificateEmailRequest(of email: String) -> Requestable {
        return Request(
            httpMethod: .post,
            path: "api/join"
        )
    }
}
