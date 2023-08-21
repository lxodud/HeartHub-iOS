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
        with theme: ArticleTheme,
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
                guard let deserializedData: FetchArticleResponseDTO = try? self.decode(from: data) else {
                    return
                }
                
                DispatchQueue.main.async {
                    completion(deserializedData.data)
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
                    guard let deserializedData: FetchReissueTokenResponseDTO = try? self.decode(from: data)
                    else {
                        return
                    }
                    
                    let accessToken = deserializedData.data.newAccessToken
                    let refreshToken = deserializedData.data.newRefreshToken
                    let token = Token(accessToken: accessToken, refreshToken: refreshToken)
                    
                    self.tokenRepository.saveToken(with: token) {
                        self.tokenRepository.fetchAccessToken(completion: { accessToken in
                            guard let accessToken = accessToken else {
                                return
                            }
                            
                            self.accessToken = accessToken
                            completion()
                        })
                    }
                    
                case .failure(let error):
                    if case NetworkError.requestFail(_, let data) = error {
                        print(error.localizedDescription)
                    }
                    break
                }
            }
        }
    }
}
