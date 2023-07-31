//
//  CommunityProfileImageView.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/26.
//

import UIKit

final class HeartHubProfileImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        contentMode = .scaleToFill
        clipsToBounds = true
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
    }
}
