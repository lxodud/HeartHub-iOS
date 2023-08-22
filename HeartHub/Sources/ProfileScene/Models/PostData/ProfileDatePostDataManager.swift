//
//  ProfileDatePostDataManager.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/03.
//

import UIKit

final class ProfileDatePostDataManager {
    private var profileDatePostDataArray: [ProfileDatePostDataModel] = []
    
    func configureProfilePostData() {
        profileDatePostDataArray = [
            ProfileDatePostDataModel(profileDatePostImage: UIImage(named: "TestImage")),
            ProfileDatePostDataModel(profileDatePostImage: UIImage(named: "TestImage")),
            ProfileDatePostDataModel(profileDatePostText: "안녕"),
            ProfileDatePostDataModel(profileDatePostText: "하세요"),
            ProfileDatePostDataModel(profileDatePostImage: UIImage(named: "TestImage")),
            ProfileDatePostDataModel(profileDatePostImage: UIImage(named: "TestImage")),
            ProfileDatePostDataModel(profileDatePostImage: UIImage(named: "TestImage")),
            ProfileDatePostDataModel(profileDatePostImage: UIImage(named: "TestImage")),
        ]
    }
    
    func fetchProfileDatePostData() -> [ProfileDatePostDataModel] {
        return profileDatePostDataArray
        
    }
}
