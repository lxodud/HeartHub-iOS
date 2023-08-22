//
//  CommentDataSource.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/22.
//

import Foundation

final class CommentDataSource {
    private var comments: [Comment] = [] {
        didSet {
            DispatchQueue.main.async {
                self.commentsPublisher?(self.comments)
            }
        }
    }
    
    private let commentNetwork = CommentNetwork(
        tokenRepository: TokenRepository(),
        networkManager: DefaultNetworkManager()
    )
    private let articleID: Int
    
    // MARK: - Output
    var commentsPublisher: (([Comment]) -> Void)?
    
    init(articleID: Int) {
        self.articleID = articleID
    }
}

// MARK: - Input
extension CommentDataSource {
    func fetchComment() {
        commentNetwork.fetchComment(with: articleID) { comments in
            self.comments = comments
        }
    }
}
