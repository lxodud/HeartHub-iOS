//
//  DailyCellProfileStackView.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/10.
//

import UIKit

final class DailyCellProfileView: UIView {
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    private let profileIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    private let postRelatedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        configureSubview()
        configureLayout()
        profileIdLabel.text = "하이"
        profileImageView.image = UIImage(systemName: "square.and.arrow.up.circle.fill")
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        profileImageView.layer.cornerRadius = profileImageView.frame.height * 0.5
    }
}

// MARK: Configure Action
extension DailyCellProfileView {
    
}

// MARK: Configure UI
extension DailyCellProfileView {
    private func configureSubview() {
        [profileImageView, profileIdLabel, postRelatedButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: ImageView Layout
            profileImageView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 15
            ),
            profileImageView.widthAnchor.constraint(
                equalTo: profileImageView.heightAnchor
            ),
            profileImageView.heightAnchor.constraint(
                equalTo: safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.3
            ),
            profileImageView.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            ),
            
            // MARK: Button Layout
            postRelatedButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -15
            ),
            postRelatedButton.widthAnchor.constraint(
                equalTo: postRelatedButton.heightAnchor
            ),
            postRelatedButton.heightAnchor.constraint(
                equalTo: safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.3
            ),
            postRelatedButton.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            ),
            
            // MARK: Label Layout
            profileIdLabel.leadingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor,
                constant: 15
            ),
            profileIdLabel.trailingAnchor.constraint(
                equalTo: postRelatedButton.leadingAnchor,
                constant: -15
            ),
            profileIdLabel.heightAnchor.constraint(
                equalTo: safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.3
            ),
            profileIdLabel.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            )
        ])
    }
}
