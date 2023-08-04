//
//  ProfileUserDataManager.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/01.
//

import UIKit

final class ProfileUserDataManager {
    private var userDataArray: [ProfileUserDataModel] = []
    
    func configureProfileUserData() {
        userDataArray = [
            ProfileUserDataModel(
                profileImage: UIImage(named: "PaperPlane"),
                profileNickName: "하트허브",
                profileInformaition: "하트허브의 프로필_!")
        ]
    }
    
    func fetchProfileUserData() -> [ProfileUserDataModel] {
        return userDataArray
    }
}
