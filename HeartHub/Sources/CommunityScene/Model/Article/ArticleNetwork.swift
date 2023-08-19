//
//  CommunityNetwork.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/19.
//

import Foundation

final class ArticleNetwork {
    private let tokenRepository: TokenRepository
    private let networkManager: NetworkManager
    
    private var accessToken: String?
    
    init(
        tokenRepository: TokenRepository,
        networkManager: NetworkManager
    ) {
        self.tokenRepository = tokenRepository
        self.networkManager = networkManager
    }
}

// MARK: Public Interface
extension ArticleNetwork {
    func fetchArticle(with theme: CommunityTheme) {
        
    }
}
