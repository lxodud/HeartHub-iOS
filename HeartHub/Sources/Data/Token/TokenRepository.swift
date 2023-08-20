//
//  TokenRepository.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/13.
//

import Foundation

final class TokenRepository {
    private let keychainManager = KeychainManager()
    private let accessTokenAttributes: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: "HeartHub",
        kSecAttrService as String: "accessToken"
    ]
    private let refreshTokenAttributes: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: "HeartHub",
        kSecAttrService as String: "refreshToken"
    ]
    private let fetchQuery: [String: Any] = [
        kSecMatchLimit as String: kSecMatchLimitOne,
        kSecReturnData as String: true
    ]
    
    private func convertTokenTokSecValueData(token: String) -> [String: Any]? {
        guard let data = token.data(using: .utf8) else {
            return nil
        }
        
        return [kSecValueData as String: data]
    }
}

// MARK: Public Interface
extension TokenRepository {
    func saveToken(with token: Token, completion: (() -> Void)? = nil) {
        guard let accessToken = convertTokenTokSecValueData(token: token.accessToken),
              let refreshToken = convertTokenTokSecValueData(token: token.refreshToken)
        else {
            return
        }
        
        let accessTokenAttributesWithData = self.accessTokenAttributes.merging(accessToken) { _, _ in }
        let fullRefreshTokenAttributesWithData = self.refreshTokenAttributes.merging(refreshToken) { _, _ in }
        
        self.keychainManager.addItem(
            with: accessTokenAttributesWithData,
            completion: { status in
                debugPrint("add access: \(status)")
                guard status != errSecDuplicateItem else {
                    self.updateToken(with: token)
                    return
                }
                
                completion?()
            })
        
        self.keychainManager.addItem(
            with: fullRefreshTokenAttributesWithData,
            completion: { status in
                debugPrint("add refresh: \(status)")
                guard status != errSecDuplicateItem else {
                    self.updateToken(with: token)
                    return
                }
                
                completion?()
            })
    }
    
    func updateToken(with token: Token, completion: (() -> Void)? = nil) {
        guard let accessToken = convertTokenTokSecValueData(token: token.accessToken),
              let refreshToken = convertTokenTokSecValueData(token: token.refreshToken)
        else {
            return
        }
        
        self.keychainManager.updateItem(
            with: self.accessTokenAttributes,
            as: accessToken,
            completion: { status in
                debugPrint("update: \(status)")
                // TODO: Handling Result
                
                completion?()
            })

        self.keychainManager.updateItem(
            with: self.refreshTokenAttributes,
            as: refreshToken,
            completion: { status in
                debugPrint("update: \(status)")
                // TODO: Handling Result
                
                completion?()
            })
    }
    
    func fetchAccessToken(completion: @escaping (String?) -> Void) {
        let query = self.accessTokenAttributes.merging(fetchQuery) { _, _ in }
        
        keychainManager.fetchItem(
            with: query,
            completion: { status, item in
                guard let data = item as? Data,
                      let token = String(data: data, encoding: .utf8)
                else {
                    completion(nil)
                    return
                }
                
                completion(token)
            })
    }
    
    func fetchRefreshToken(completion: @escaping (String?) -> Void) {
        let query = self.refreshTokenAttributes.merging(fetchQuery) { _, _ in }
        
        keychainManager.fetchItem(
            with: query,
            completion: { status, item in
                guard let data = item as? Data,
                      let token = String(data: data, encoding: .utf8)
                else {
                    completion(nil)
                    return
                }
                
                completion(token)
            })
    }
    
    func deleteToken() {
        keychainManager.deleteItem(
            with: accessTokenAttributes,
            completion: { status in
               print("access delete: \(status)")
            })
        
        keychainManager.deleteItem(
            with: refreshTokenAttributes,
            completion: { status in
                print("refresh delete: \(status)")
            })
    }
}
