//
//  MissionDataManager.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/03.
//

import UIKit

final class MissionDataManager {
    private var missionDataArray: [String] = []
    
    func configureMissionData() {
        missionDataArray = [
            "석촌호수 빨간 등대 앞에서 사진찍기",
            "애인 잘 때 얼굴에 낙서하기",
            "미션 내용",
            "미션 내용"
        ]
    }
    
    func fetchConfigureData() -> [String] {
        return missionDataArray
    }
}


