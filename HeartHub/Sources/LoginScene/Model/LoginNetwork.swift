//
//  LoginNetwork.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/19.
//

import UIKit

final class LoginNetwork {
    private let tokenRepository: TokenRepository
    private let networkManager: NetworkManager
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

// MARK: Public Interface
extension LoginNetwork {
    func login(id: String, password: String, completion: @escaping () -> Void) {
        let request = UserRelatedRequestFactory.makeSignInRequest(
            of: SignInRequestDTO(username: id, password: password)
        )
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(let data):
                do {
                    let deserializedData: FetchTokenResponseDTO = try self.decode(from: data)
                    guard deserializedData.isSuccess == true else {
                        return
                    }
                    
                    self.saveCurrentUserInformation(id: id, token: deserializedData.data.accessToken)
                    self.tokenRepository.saveToken(with: deserializedData.data)
                    completion()
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func saveCurrentUserInformation(id: String, token: String) {
        let request = UserRelatedRequestFactory.makeGetUserInfo(of: id, token: token)
        let userInformationRepository = UserInformationRepository()
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(let data):
                do {
                    let deserializedData: GetUserInfoResponseDTO = try self.decode(from: data)
                    
                    let nickname = deserializedData.data.nickname
                    userInformationRepository.saveNickname(with: nickname)
                    
                    guard let imageUrlString = deserializedData.data.userImageUrl,
                          let imageUrl = URL(string: imageUrlString)
                          
                    else {
                        let imageData = UIImage(named: "BasicProfileImage")!.pngData()!
                        
                        userInformationRepository.saveProfileImage(with: imageData)
                        return
                    }
                    
                    ImageProvider.shared.fetch(from: imageUrl) { result in
                        switch result {
                        case .success(let data):
                            userInformationRepository.saveProfileImage(with: data)
                        case .failure(let error):
                            print(error)
                        }
                    }
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
