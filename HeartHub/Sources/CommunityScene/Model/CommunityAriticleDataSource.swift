//
//  CommunityAriticleDataSource.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/21.
//

import Foundation

final class CommunityArticleDataSource {
    var articles: [Article] = [] {
        didSet {
            articlesHandler?(articles)
        }
    }
    
    private let articleNetwork = ArticleNetwork(
        tokenRepository: TokenRepository(),
        networkManager: DefaultNetworkManager()
    )
    private let theme: CommunityTheme
    private var articlesHandler: (([Article]) -> Void)?
    
    init(theme: CommunityTheme) {
        self.theme = theme
    }
    
    func bind(_ handler: @escaping ([Article]) -> Void) {
        self.articlesHandler = handler
    }
    
    func fetchArticle() {
        articleNetwork.fetchArticle(with: theme) { articles in
            self.articles = articles
        }
    }
}
