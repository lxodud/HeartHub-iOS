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
        kSecClass as String: kSecClassKey,
        kSecAttrLabel as String: "accessToken",
        kSecAttrApplicationLabel as String: "HeartHub"
    ]
    private let refreshTokenAttributes: [String: Any] = [
        kSecClass as String: kSecClassKey,
        kSecAttrLabel as String: "refreshToken",
        kSecAttrApplicationLabel as String: "HeartHub"
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
    func saveToken(with token: JWTToken) {
        guard let accessToken = convertTokenTokSecValueData(token: token.accessToken),
              let refreshToken = convertTokenTokSecValueData(token: token.refreshToken)
        else {
            return
        }
        
        let AccessTokenAttributesWithData = self.accessTokenAttributes.merging(accessToken) { _, _ in }
        let fullRefreshTokenAttributesWithData = self.refreshTokenAttributes.merging(refreshToken) { _, _ in }
        
        self.keychainManager.addItem(
            with: AccessTokenAttributesWithData,
            completion: { status in
                guard status != errSecDuplicateItem else {
                    self.updateToken(with: token)
                    return
                }
            })
        
        self.keychainManager.addItem(
            with: fullRefreshTokenAttributesWithData,
            completion: { status in
                guard status != errSecDuplicateItem else {
                    self.updateToken(with: token)
                    return
                }
            })
    }
    
    func updateToken(with token: JWTToken) {
        guard let accessToken = convertTokenTokSecValueData(token: token.accessToken),
              let refreshToken = convertTokenTokSecValueData(token: token.refreshToken)
        else {
            return
        }
        
        self.keychainManager.updateItem(
            with: self.accessTokenAttributes,
            as: accessToken,
            completion: { status in
                // TODO: Handling Result
            })

        self.keychainManager.updateItem(
            with: self.refreshTokenAttributes,
            as: refreshToken,
            completion: { status in
                // TODO: Handling Result
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
                
            })
        
        keychainManager.deleteItem(
            with: refreshTokenAttributes,
            completion: { status in
                
            })
    }
}
