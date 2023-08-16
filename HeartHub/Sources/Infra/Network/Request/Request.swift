//
//  Endpoint.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/12.
//

import Foundation

struct Request: Requestable {
    let baseURL: String
    let httpMethod: HTTPMethod
    let path: String
    let queryItems: [URLQueryItem]
    let headers: [String : String]
    
    init(
        baseURL: String = "http://43.200.191.238:9000",
        httpMethod: HTTPMethod,
        path: String = "",
        queryItems: [URLQueryItem] = [],
        headers: [String: String] = [:]
    ) {
        self.baseURL = baseURL
        self.httpMethod = httpMethod
        self.path = path
        self.queryItems = queryItems
        self.headers = headers
    }
    
    func makeURLRequest() -> URLRequest? {
        guard let url = makeURL() else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpMethod = httpMethod.rawValue
        
        return urlRequest
    }
}
