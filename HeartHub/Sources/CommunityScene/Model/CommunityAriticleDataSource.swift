//
//  CommunityAriticleDataSource.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/21.
//

import Foundation

final class CommunityArticleDataSource {
    private var articles: [Article] = [] {
        didSet {
            articlesPublisher?(articles)
        }
    }
    private let articleNetwork = ArticleNetwork(
        tokenRepository: TokenRepository(),
        networkManager: DefaultNetworkManager()
    )
    private let theme: ArticleTheme
    
    // MARK: - Output
    var articlesPublisher: (([Article]) -> Void)?
    
    init(theme: ArticleTheme) {
        self.theme = theme
    }
}

// MARK: - Input
extension CommunityArticleDataSource {
    func fetchArticle() {
        articleNetwork.fetchArticle(with: theme) { articles in
            self.articles = articles
        }
    }
}
