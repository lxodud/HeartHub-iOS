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
    
    private let networkManager: NetworkManager = DefaultNetworkManager()
    
}

// MARK: Requst Network
extension UserInformationManager {
    func checkIDAvailability(
        with id: String,
        completion: @escaping (Bool) -> Void
    ) {
        guard userID != id else {
            return
        }
        
        let request = UserRelatedRequestFactory.makeIdCheckRequest(of: id)
        
        networkManager.request(endpoint: request) { result in
            switch result {
            case .success(let data):
                self.userID = id
                do {
                    let deserializedData = try JSONDecoder().decode(CheckAvailabilityResponseDTO.self, from: data)
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
}
