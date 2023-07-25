//
//  CommunityProfileImageView.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/26.
//

import UIKit

final class CommunityProfileImageView: UIImageView {
    override func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
    }
}
