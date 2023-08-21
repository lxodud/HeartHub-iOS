//
//  UserInformation.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/21.
//

import Foundation

final class UserInformationRepository {
    private let store = UserDefaults.standard
}

extension UserInformationRepository {
    func saveProfileImage(with imageData: Data) {
        store.set(imageData, forKey: "profileImage")
    }
    
    func saveNickname(with nickname: String) {
        store.set(nickname, forKey: "nickname")
    }
    
    func fetchProfileImage() -> Data? {
        return store.data(forKey: "profileImage")
    }
    
    func fetchNickname() -> String? {
        return store.string(forKey: "nickname")
    }
}
