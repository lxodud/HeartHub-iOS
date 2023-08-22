//
//  ArticleContentNetwork.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/22.
//

import Foundation

final class ArticleContentNetwork {
    private let tokenRepository: TokenRepository
    private let networkManager: NetworkManager
    private let tokenExpierResolver = TokenExpierResolver()
    private let decoder = JSONDecoder()
    
    init(
        tokenRepository: TokenRepository,
        networkManager: NetworkManager
    ) {
        self.tokenRepository = tokenRepository
        self.networkManager = networkManager
    }
    
    private func decode<T: Decodable>(from data: Data) throws -> T {
        return try decoder.decode(T.self, from: data)
    }
}

// MARK: - Public Interface
extension ArticleContentNetwork {
    func postScrapOrCancelArticle(
        username: String,
        articleID: Int
    ) {
        guard let accessToken = tokenRepository.fetchAccessToken() else {
            return
        }
        
        guard let request = CommunityRequestFactory.makeScrapArticleRequest(
            with: ScrapArticleRequestDTO(username: username, articleID: articleID),
            token: accessToken
        ) else {
            return
        }
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                self.tokenExpierResolver.validateExpireAccessTokenError(error) {
                    self.postGoodArticle(username: username, articleID: articleID)
                }
            }
        }
    }
    
    func postGoodArticle(
        username: String,
        articleID: Int
    ) {
        guard let accessToken = tokenRepository.fetchAccessToken() else {
            return
        }
        
        let request = CommunityRequestFactory.makePostArticleGoodRequest(
            username: username,
            articleID: articleID,
            token: accessToken
        )
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                self.tokenExpierResolver.validateExpireAccessTokenError(error) {
                    self.postGoodArticle(username: username, articleID: articleID)
                }
            }
        }
    }
    
    func fetchGoodCount(
        from articleId: Int,
        completion: @escaping (Int) -> Void
    ) {
        guard let accessToken = tokenRepository.fetchAccessToken() else {
            return
        }
        
        let request = CommunityRequestFactory.makeFetchArticleLikeCountRequest(
            with: articleId,
            token: accessToken
        )
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(let data):
                guard let deserializedData: FetchGoodCountResponseDTO = try? self.decode(from: data) else {
                    return
                }
                
                DispatchQueue.main.async {
                    completion(deserializedData.data)
                }
            case .failure(let error):
                print(#function)
                self.tokenExpierResolver.validateExpireAccessTokenError(error) {
                    self.fetchGoodCount(from: articleId, completion: completion)
                }
            }
        }
    }
    
    func fetchAuthorInformation(
        from userId: Int,
        completion: @escaping (String?) -> Void
    ) {
        guard let accessToken = tokenRepository.fetchAccessToken() else {
            return
        }
        
        let request = UserRelatedRequestFactory.makeGetUserInformation(
            of: userId,
            token: accessToken
        )
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(let data):
                guard let deserializedData: GetUserInformationResponseDTO = try? self.decode(from: data),
                      let imageUrl = deserializedData.data.userImageUrl
                else {
                    completion(nil)
                    return
                }
                
                completion(imageUrl)
            case .failure(let error):
                print(#function)
                self.tokenExpierResolver.validateExpireAccessTokenError(error) {
                    self.fetchAuthorInformation(from: userId, completion: completion)
                }
            }
        }
    }
}
