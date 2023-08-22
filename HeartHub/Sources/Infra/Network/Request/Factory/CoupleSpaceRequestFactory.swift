//
//  CoupleSpaceRequestFactory.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/23.
//

import Foundation

struct CoupleSpaceRequestFactory {
    static func makeFetchMyScrapArticleRequest(token: String) -> Requestable {
        return Request(
            httpMethod: .get,
            path: "/api/user/scrap-board",
            headers: ["Authorization": token]
        )
    }
    
    static func makeFetchMateScrapArticleRequest(token: String) -> Requestable {
        return Request(
            httpMethod: .get,
            path: "/api/user/scrap-board",
            headers: ["Authorization": token]
        )
    }
    
    static func makeFetchAlbumRequest(at date: String, token: String) -> Requestable {
        return Request(
            httpMethod: .get,
            path: "/api/user/couple-board/\(date)",
            headers: ["Authorization": token]
        )
    }
    
    static func makePostAlbumRequest(
        content: PostAlbumRequestDTO,
        imageData: Data,
        token: String
    ) -> Requestable? {
        guard let jsonData = try? JSONEncoder().encode(content) else {
            return nil
        }
        
        var multipartData = [
            ("requestDto", UUID().uuidString, "application/json", jsonData)
        ]
        
        multipartData.append(("files", UUID().uuidString, "image/png", imageData))
        
        return MultipartBodyRequest(
            httpMethod: .get,
            path: "/api/user/couple-board/write",
            headers: ["Authorization": token],
            multipartData: multipartData
        )
    }
}
