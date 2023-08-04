//
//  ProfileLookPostDataManager.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/03.
//

import UIKit

final class ProfileLookPostDataManager {
    private var profileLookPostDataArray: [ProfileLookPostDataModel] = []
    
    func configureProfileLookPostData() {
        profileLookPostDataArray = [
            ProfileLookPostDataModel(profileLookPostImage: UIImage(named: "TestImage")),
            ProfileLookPostDataModel(profileLookPostImage: UIImage(named: "TestImage")),
            ProfileLookPostDataModel(profileLookPostImage: UIImage(named: "TestImage")),
            ProfileLookPostDataModel(profileLookPostImage: UIImage(named: "TestImage"))
        ]
    }
    
    func fetchProfileLookPostData() -> [ProfileLookPostDataModel] {
        return profileLookPostDataArray
    }
}
