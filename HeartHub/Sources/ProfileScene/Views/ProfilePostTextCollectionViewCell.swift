//
//  ProfilePostTextCollectionViewCell.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/15.
//

import UIKit

class ProfilePostTextCollectionViewCell: UICollectionViewCell {
    
    var profilePostText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.numberOfLines = 2
        label.lineBreakMode = .byClipping
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        self.contentView.addSubview(profilePostText)
        profilePostText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profilePostText.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            profilePostText.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ])
    }
}
