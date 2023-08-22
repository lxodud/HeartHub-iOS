//
//  CommunityCellDataSource.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/21.
//

import Foundation

final class CommunityCellDataSource {
    private let article: Article
    private var goodInformation: (status: Bool, count: Int) = (false, 0) {
        didSet {
            DispatchQueue.main.async {
                self.goodInformationPublisher?(self.goodInformation.status, self.goodInformation.count)
            }
        }
    }
    private var heartStatus: Bool? = false {
        didSet {
            guard let heartStatus = heartStatus else {
                return
            }
            DispatchQueue.main.async {
                self.heartStatusPublisher?(heartStatus)
            }
        }
    }
    private var content: String = "" {
        didSet {
            DispatchQueue.main.async {
                self.contentPublisher?(self.content)
            }
        }
    }
    private var authorProfileInformation: (username: String, image: Data?) = ("", nil) {
        didSet {
            DispatchQueue.main.async {
                self.authorProfileInformationPublisher?(
                    self.authorProfileInformation.username,
                    self.authorProfileInformation.image
                )
            }
        }
    }
    private var commentCount: Int = 0 {
        didSet {
            DispatchQueue.main.async {
                self.commentCountPublisher?(self.commentCount)
            }
        }
    }
    private var images: [Data] = [] {
        didSet {
            DispatchQueue.main.async {
                self.imagesPublisher?(self.images)
            }
        }
    }
    private let articleContentNetwork: ArticleContentNetwork
    
    // MARK: - Output
    var goodInformationPublisher: ((Bool, Int) -> Void)?
    var heartStatusPublisher: ((Bool) -> Void)?
    var imagesPublisher: (([Data]) -> Void)?
    var contentPublisher: ((String) -> Void)?
    var authorProfileInformationPublisher: ((String, Data?) -> Void)?
    var commentCountPublisher: ((Int) -> Void)?
    
    init(
        article: Article,
        articleContentNetwork: ArticleContentNetwork
    ) {
        self.article = article
        self.articleContentNetwork = articleContentNetwork
    }
}

// MARK: - Input
extension CommunityCellDataSource {
    func fetchCellContents() {
        fetchGoodCount()
        fetchAuthorInformation()
        fetchImages()
        
        content = article.content
        heartStatus = article.heartStatus
        commentCount = article.commentList.count
    }
}

// MARK: - Network
extension CommunityCellDataSource {
    private func fetchImages() {
        let serialQueue = DispatchQueue(label: "fetch image")
        
        article.communityImageUrl.forEach {
            guard let url = URL(string: $0) else {
                return
            }
            
            ImageProvider.shared.fetch(from: url, queue: serialQueue) { result in
                switch result {
                case .success(let data):
                    self.images.append(data)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func fetchGoodCount() {
        articleContentNetwork.fetchGoodCount(from: article.articleID) { count in
            self.goodInformation = (self.article.goodStatus ?? false, count)
        }
    }
    
    private func fetchAuthorInformation() {
        articleContentNetwork.fetchAuthorInformation(from: article.userID) { imageLocation in
            guard let imageLocation = imageLocation,
                  let imageUrl = URL(string: imageLocation)
            else {
                self.authorProfileInformation = (self.article.username, nil)
                return
            }
            
            ImageProvider.shared.fetch(from: imageUrl) { result in
                switch result {
                case .success(let data):
                    self.authorProfileInformation = (self.article.username, data)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
