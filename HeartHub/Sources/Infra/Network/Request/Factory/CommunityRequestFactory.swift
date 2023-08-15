//
//  CommunityRequestFactory.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/15.
//

import Foundation

struct CommunityRequestFactory {
    static func makePostArticleRequest(
        articleContent: PostArticleRequestDTO,
        imageData: [Data],
        token: String
    ) -> Requestable? {
        guard let jsonData = try? JSONEncoder().encode(articleContent) else {
            return nil
        }
        
        var multipartData = [
            ("params", UUID().uuidString, "application/json", jsonData)
        ]
        
        imageData.forEach {
            multipartData.append(("files", UUID().uuidString, "image/png", $0))
        }
        
        return MultipartBodyRequest(
            httpMethod: .post,
            headers: ["Authorization": token],
            multipartData: multipartData
        )
    }
}
