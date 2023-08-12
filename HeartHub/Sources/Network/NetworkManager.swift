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
    func request(
        endpoint: Requestable,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        
    }
}
