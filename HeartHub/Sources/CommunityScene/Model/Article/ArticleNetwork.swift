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
    private let decoder = JSONDecoder()
    
    private var accessToken: String?
    
    init(
        tokenRepository: TokenRepository,
        networkManager: NetworkManager
    ) {
        self.tokenRepository = tokenRepository
        self.networkManager = networkManager
        fetchAccessToken()
    }
    
    private func fetchAccessToken() {
        tokenRepository.fetchAccessToken { accessToken in
            self.accessToken = accessToken
        }
    }
    
    private func decode<T: Decodable>(from data: Data) throws -> T {
        return try decoder.decode(T.self, from: data)
    }
}

// MARK: Public Interface
extension ArticleNetwork {
    func fetchArticle(
        with theme: CommunityTheme,
        completion: @escaping ([Article]) -> Void
    ) {
        guard let accessToken = accessToken else {
            return
        }
        
        let request = CommunityRequestFactory.makeFetchCommunityArticleRequest(
            with: theme,
            token: accessToken
        )
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(let data):
                do {
                    let deserializedData: FetchArticleResponseDTO = try self.decode(from: data)
                    DispatchQueue.main.async {
                        completion(deserializedData.data)
                    }
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                if case NetworkError.requestFail(_, let data) = error {
                    guard let data = data else {
                        return
                    }
                    
                    let deserializedData: RequestFailResponseDTO? = try? self.decode(from: data)
                    
                    if deserializedData?.code == 3000 {
                        self.resolveExpireAccessToken {
                            self.fetchArticle(with: theme, completion: completion)
                        }
                    }
                }
            }
        }
    }
    
    private func resolveExpireAccessToken(completion: @escaping () -> Void) {
        tokenRepository.fetchRefreshToken { refreshToken in
            guard let refreshToken = refreshToken else {
                return
            }
            
            let request = UserRelatedRequestFactory.makeReissueTokenRequest(token: refreshToken)
            
            self.networkManager.request(endpoint: request) { result in
                switch result {
                case .success(let data):
                    do {
                        let deserializedData: FetchTokenResponseDTO = try self.decode(from: data)
                        guard deserializedData.isSuccess == true else {
                            return
                        }
                        
                        self.tokenRepository.saveToken(with: deserializedData.data) {
                            self.tokenRepository.fetchAccessToken(completion: { accessToken in
                                guard let accessToken = accessToken else {
                                    return
                                }
                                        
                                self.accessToken = accessToken
                                completion()
                            })
                        }
                        
                    } catch let error {
                        print(error)
                    }
                case .failure(let error):
                    if case NetworkError.requestFail(_, let data) = error {
                        
                    }
                    break
                }
            }
        }
    }
}
