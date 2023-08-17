//
//  NetworkManager.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/10.
//

import Foundation

protocol NetworkManager {
    func request(
        endpoint: Requestable,
        completion: @escaping (Result<Data, Error>) -> Void
     )
}

final class DefaultNetworkManager: NetworkManager {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request(
        endpoint: Requestable,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        guard let request = endpoint.makeURLRequest() else {
            // TODO: Error Handling
            return
        }
        
        if let body = request.httpBody {
            uploadData(request: request, body: body, completion: completion)
        } else {
            requestData(request: request, completion: completion)
        }
    }
    
    private func requestData(
        request: URLRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...2999) ~= httpResponse.statusCode
            else {
                // TODO: Error Handling
                return
            }
            
            guard let data = data else {
                return
            }
            
            completion(.success(data))
        }
    }
    
    private func uploadData(
        request: URLRequest,
        body: Data,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        session.uploadTask(with: request, from: body) { data, response, error in
            guard error == nil else {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...2999) ~= httpResponse.statusCode
            else {
                // TODO: Error Handling
                return
            }
            
            guard let data = data else {
                return
            }
            
            completion(.success(data))
        }
    }
}
