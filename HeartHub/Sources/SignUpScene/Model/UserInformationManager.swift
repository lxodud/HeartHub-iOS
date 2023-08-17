//
//  UserInformationManager.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/17.
//

import Foundation

final class UserInformationManager {
    var username: String?
    var password: String?
    var gender: String?
    var email: String?
    var nickname: String?
    var marketingStatus: String?
    var mate: String?
    var datingDate: String?
    var birth: String?
}

// MARK: Input
extension UserInformationManager {
    func inputDatingDate(with date: String?) {
        self.datingDate = date
    }
}
