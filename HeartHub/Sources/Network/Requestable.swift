//
//  Requestable.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/10.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Requestable {
    var baseURL: String { get }
    var httpMethod: HTTPMethod { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var headers: [String: String] { get }
}

extension Requestable {
    func makeURL() -> URL? {
        guard var component = URLComponents(string: baseURL) else {
            return nil
        }
        
        component.path = path
        component.queryItems = queryItems
        
        return component.url
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

final class Endpoint: Requestable {
    let baseURL: String
    let httpMethod: HTTPMethod
    let path: String
    let queryItems: [URLQueryItem]
    let headers: [String : String]
    
    init(
        baseURL: String = "http://43.200.191.238:9000",
        httpMethod: HTTPMethod = .get,
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
}
