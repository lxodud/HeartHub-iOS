////
////  DailyDateNoImageCellDataSource.swift
////  HeartHub
////
////  Created by 이태영 on 2023/08/21.
////
//
//import Foundation
//
//final class DailyDateNoImageCellDataSource {
//    private let article: Article
//    private var goodInformation: (status: Bool?, count: Int?) = (false, nil) {
//        didSet {
//            guard let goodStatus = goodInformation.status,
//                  let goodCount = goodInformation.count
//            else {
//                return
//            }
//            
//            goodInformationPublisher?(goodStatus, goodCount)
//        }
//    }
//    private var heartStatus: Bool? = false {
//        didSet {
//            guard let heartStatus = heartStatus else {
//                return
//            }
//            
//            heartStatusPublisher?(heartStatus)
//        }
//    }
//    private var content: String = "" {
//        didSet {
//            contentPublisher?(content)
//        }
//    }
//    private var authorProfileInformation: (username: String, image: Data) = ("", Data()) {
//        didSet {
//            authorProfileInformationPublisher?(
//                authorProfileInformation.username,
//                authorProfileInformation.image
//            )
//        }
//    }
//    private var commentCount: Int = 0 {
//        didSet {
//            commentCountPublisher?(commentCount)
//        }
//    }
//    private let articleContentNetwork: ArticleContentNetwork
//    
//    
//    // MARK: - Output
//    var goodInformationPublisher: ((Bool, Int) -> Void)?
//    var heartStatusPublisher: ((Bool) -> Void)?
//    var contentPublisher: ((String) -> Void)?
//    var authorProfileInformationPublisher: ((String, Data) -> Void)?
//    var commentCountPublisher: ((Int) -> Void)?
//    
//    
//    init(
//        article: Article,
//        articleContentNetwork: ArticleContentNetwork
//    ) {
//        self.article = article
//        self.articleContentNetwork = articleContentNetwork
//    }
//}
//
//// MARK: - Input
//extension DailyDateNoImageCellDataSource {
//    func fetchCellContents() {
//        fetchGoodCount()
//        fetchAuthorInformation()
//        
//        content = article.content
//        heartStatus = article.heartStatus
//        commentCount = article.commentList.count
//    }
//}
//
//// MARK: - Network
//extension DailyDateNoImageCellDataSource {
//    private func fetchGoodCount() {
//        articleContentNetwork.fetchGoodCount(from: article.articleID) { count in
//            self.goodInformation = (self.article.goodStatus, count)
//        }
//    }
//    
//    private func fetchAuthorInformation() {
//        articleContentNetwork.fetchAuthorInformation(from: article.userID) { imageLocation in
//            guard let imageUrl = URL(string: imageLocation) else {
//                return
//            }
//            
//            ImageProvider.shared.fetch(from: imageUrl) { result in
//                switch result {
//                case .success(let data):
//                    self.authorProfileInformation = (self.article.username, data)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//        }
//    }
//}
