//
//  DailyDateNoImageCellDataSource.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/21.
//

import Foundation

final class DailyDateNoImageCellDataSource {
    private let article: Article
    private var goodInformation: (Bool, Int?) = (false, nil)
    private var heartInformation: Bool = false
    private var content: String = ""
    private var authorProfileInformation: (String, Data) = ("", Data())
    private var commentCount: Int?
    private let articleNetwork: ArticleNetwork
    
    // MARK: - Output
    var goodInformationPublisher: ((_ status: Bool, _ count: Int) -> Void)?
    var heartStatusPublisher: ((_ status: Bool) -> Void)?
    var contentPublisher: ((String) -> Void)?
    var authorProfileInformationPublisher: ((_ username: String, _ profileImage: Data) -> Void)?
    var commentCountPublisher: ((Int) -> Void)?
    
    
    init(
        article: Article,
        articleNetwork: ArticleNetwork
    ) {
        self.article = article
        self.articleNetwork = articleNetwork
    }
}

// MARK: - Input
extension DailyDateNoImageCellDataSource {
    func fetchCellContents() {
        
    }
}

// MARK: - Network
extension DailyDateImageCellDataSource {
    
}
