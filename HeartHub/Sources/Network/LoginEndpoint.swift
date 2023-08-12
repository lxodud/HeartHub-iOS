//
//  LoginEndpoint.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/12.
//

import Foundation

struct LoginEndpoint {
    static func makeEmailCheckEndpoint(of email: String) -> Requestable {
        return Request(
            path: "api/check/email/" + email
        )
    }
    
    static func makeIdCheckApiEndpoint(of id: String) -> Requestable {
        return Request(
            path: "api/check/username/" + id
        )
    }
    
    static func makeVerificateEmailEndPoint(of email: String) -> Requestable {
        return Request(
            httpMethod: .post,
            path: "api/join"
        )
    }
}
