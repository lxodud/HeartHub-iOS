//
//  MockData.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/20.
//

import UIKit

struct MockData {
    var images: [UIImage]
    var profileImage: UIImage
    var profileName: String
    var postLabel: String
}

let mockData = [
    MockData(
        images: [UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!],
        profileImage: UIImage(named: "test1")!,
        profileName: "안녕",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!],
        profileImage: UIImage(named: "crown")!,
        profileName: "허허",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [UIImage(systemName: "pencil.circle.fill")!],
        profileImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")!,
        profileName: "히히",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!],
        profileImage: UIImage(named: "test1")!,
        profileName: "안녕",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!],
        profileImage: UIImage(named: "test1")!,
        profileName: "안녕",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!,
                 UIImage(named: "test1")!],
        profileImage: UIImage(systemName: "plus")!,
        profileName: "안녕",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    )
]
