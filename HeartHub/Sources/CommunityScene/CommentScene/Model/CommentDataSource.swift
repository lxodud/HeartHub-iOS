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
    
    func postComment(_ content: String) {
        guard let username = UserInformationRepository().fetchUsername() else {
            return
        }
        
        commentNetwork.postComment(
            username: username,
            articleID: articleID,
            content: content
        )
        
        let newComment = Comment(
            commentID: 0,
            username: username,
            content: content,
            replyComment: [],
            userID: 0,
            heartCount: 0
        )
        
        comments.insert(newComment, at: 0)
    }
}
