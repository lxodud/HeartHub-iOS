//
//  LoginRequestFactory.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/12.
//

import Foundation

struct LoginRequestFactory {
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
    
    static func makeJoinRequest(of body: JoinRequestDTO) -> Requestable {
        return JSONBodyRequest(
            httpMethod: .post,
            path: "api/join",
            jsonBody: body
        )
    }
    
    static func makeSignInRequest(of body: SignInRequestDTO) -> Requestable {
        return JSONBodyRequest(
            httpMethod: .post,
            path: "api/login",
            jsonBody: body
        )
    }
}
