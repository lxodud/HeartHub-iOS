//
//  KeychainManager.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/13.
//

import Foundation

final class KeychainManager {
    private let queue = DispatchQueue.global()
}

// MARK: Public Interface
extension KeychainManager {
    func fetchItem(
        with query: [String: Any],
        completion: @escaping (OSStatus, CFTypeRef?) -> Void
    ) {
        queue.async {
            var item: CFTypeRef?
            let status = SecItemCopyMatching(query as CFDictionary, &item)
            completion(status, item)
        }
    }
    
    func addItem(
        with attributes: [String: Any],
        completion: @escaping (OSStatus) -> Void
    ) {
        queue.async {
            let status = SecItemAdd(attributes as CFDictionary, nil)
            completion(status)
        }
    }
    
    func updateItem(
        with query: [String: Any],
        as attributes: [String: Any],
        completion: @escaping (OSStatus) -> Void
    ) {
        queue.async {
            let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
            completion(status)
        }
    }
    
    func deleteItem(
        with query: [String: Any],
        completion: @escaping (OSStatus) -> Void
    ) {
        queue.async {
            let status = SecItemDelete(query as CFDictionary)
            completion(status)
        }
    }
}
