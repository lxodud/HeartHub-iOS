//
//  ProfilePostDataManager.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/01.
//

import UIKit

final class ProfilePostDataManager {
    private var postDataArray: [ProfilePostDataModel] = []
    
    func configureProfilePostData() {
        postDataArray = [
            ProfilePostDataModel(postImage: UIImage(named: "TestImage")),
            ProfilePostDataModel(postImage: UIImage(named: "TestImage")),
            ProfilePostDataModel(postImage: UIImage(named: "TestImage")),
            ProfilePostDataModel(postImage: UIImage(named: "TestImage")),
            ProfilePostDataModel(postImage: UIImage(named: "TestImage")),
            ProfilePostDataModel(postImage: UIImage(named: "TestImage")),
            ProfilePostDataModel(postImage: UIImage(named: "TestImage")),
        ]
    }
    
    func fetchProfilePostData() -> [ProfilePostDataModel] {
        return postDataArray
        
    }
}
