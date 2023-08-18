//
//  UserInformationManager.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/17.
//

import Foundation

final class UserInformationManager {
    var userID: String?
    var password: String?
    var gender: String?
    var email: String?
    var nickname: String?
    var marketingStatus: String?
    var mate: String?
    var datingDate: String?
    var birth: String?
    
    private var emailCertificationNumber: Int?
    private let networkManager: NetworkManager = DefaultNetworkManager()
    private let decoder = JSONDecoder()
    
    private func decode<T: Decodable>(from data: Data) throws -> T {
        return try decoder.decode(T.self, from: data)
    }
}

// MARK: Requst Network
extension UserInformationManager {
    func checkIDAvailability(with id: String, completion: @escaping (Bool) -> Void) {
        guard userID != id else {
            return
        }
        
        let request = UserRelatedRequestFactory.makeIdCheckRequest(of: id)
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(let data):
                self.userID = id
                do {
                    let deserializedData: CheckAvailabilityResponse = try self.decode(from: data)
                    completion(deserializedData.data)
                } catch let error {
                    print(error)
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func checkNicknameAvailability(with inputNickname: String, completion: @escaping (Bool) -> Void) {
        guard nickname != inputNickname else {
            return
        }
        
        let request = UserRelatedRequestFactory.makeNicknameCheckRequest(of: inputNickname)
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(let data):
                self.nickname = inputNickname
                do {
                    let deserializedData: CheckAvailabilityResponse = try self.decode(from: data)
                    completion(deserializedData.data)
                } catch let error {
                    print(error)
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func sendVerificationCodeToEmail(with email: String) {
        let request = UserRelatedRequestFactory.makeVerificateEmailRequest(of: email)
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(let data):
                do {
                    let deserializedData: EmailVerificationResponse = try self.decode(from: data)
                    self.emailCertificationNumber = Int(deserializedData.data)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
