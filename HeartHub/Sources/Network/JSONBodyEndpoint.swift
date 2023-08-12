//
//  JSONBodyEndpoint.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/12.
//

import Foundation

struct JSONBodyEndpoint: JSONBodyRequestable {
    let baseURL: String
    let httpMethod: HTTPMethod
    let path: String
    let queryItems: [URLQueryItem]
    let headers: [String : String]
    let jsonBody: Encodable
    
    func makeURLRequest() -> URLRequest? {
        guard let url = makeURL() else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = httpMethod.rawValue
        
        let body = try? JSONEncoder().encode(jsonBody)
        urlRequest.httpBody = body
        
        return urlRequest
    }
}
