//
//  UserRelatedRequestFactory.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/12.
//

import Foundation

struct UserRelatedRequestFactory {
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
    
    static func makeGetDatingDateRequest(token: String) -> Requestable {
        return Request(
            httpMethod: .get,
            path: "api/user/datingDate",
            headers: ["Authorization": token]
        )
    }
    
    static func makeGetUserInfo(of id: String, token: String) -> Requestable {
        return Request(
            httpMethod: .get,
            path: "api/user/info/" + id,
            headers: ["Authorization": token]
        )
    }
    
    static func makeCheckMateExistRequest(token: String) -> Requestable {
        return Request(
            httpMethod: .get,
            path: "api/user/exist-mate",
            headers: ["Authorization": token]
        )
    }
    
    static func makeSetMateRequest(of body: SetMateRequestDTO, token: String) -> Requestable {
        return JSONBodyRequest(
            httpMethod: .post,
            path: "api/user/set/mate",
            headers: ["Authorization": token],
            jsonBody: body
        )
    }
    
    static func makeFindUsernameRequest(of body: FindUsernameRequestDTO) -> Requestable {
        return JSONBodyRequest(
            httpMethod: .post,
            path: "api/find/username",
            jsonBody: body
        )
    }
    
    static func makeReissueTokenRequest(token: String) -> Requestable {
        return Request(
            httpMethod: .post,
            path: "api/reissue",
            headers: ["Authorization": token]
        )
    }
    
    static func makeLogoutRequest(token: String) -> Requestable {
        return Request(
            httpMethod: .post,
            path: "api/member/logout",
            headers: ["Authorization": token]
        )
    }
    
    static func makeFindPasswordRequest(of body: FindPasswordRequestDTO) -> Requestable {
        return JSONBodyRequest(
            httpMethod: .post,
            path: "api/find/passwd",
            jsonBody: body
        )
    }
    
    static func makeDeleteUserRequest(token: String) -> Requestable {
        return Request(
            httpMethod: .post,
            path: "api/member/delete/user",
            headers: ["Authorization": token]
        )
    }
}
