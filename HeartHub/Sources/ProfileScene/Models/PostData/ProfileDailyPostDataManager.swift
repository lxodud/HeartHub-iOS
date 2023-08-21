//
//  ProfilePostDataManager.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/01.
//

import UIKit

final class ProfileDailyPostDataManager {
    private var profileDailyPostDataArray: [ProfileDailyPostDataModel] = []
    
    func configureProfilePostData() {
        profileDailyPostDataArray = [
            ProfileDailyPostDataModel(profileDailyPostImage: UIImage(named: "TestImage")),
            ProfileDailyPostDataModel(profileDailyPostText: "데일리"),
            ProfileDailyPostDataModel(profileDailyPostImage: UIImage(named: "TestImage")),
            ProfileDailyPostDataModel(profileDailyPostImage: UIImage(named: "TestImage")),
            ProfileDailyPostDataModel(profileDailyPostText: "메롱"),
            ProfileDailyPostDataModel(profileDailyPostImage: UIImage(named: "TestImage")),
            ProfileDailyPostDataModel(profileDailyPostImage: UIImage(named: "TestImage")),
        ]
    }
    
    func fetchProfileDailyPostData() -> [ProfileDailyPostDataModel] {
        return profileDailyPostDataArray
        
    }
}
