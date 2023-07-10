//
//  DailyCellProfileStackView.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/10.
//

import UIKit

protocol CommunityCellProfileViewDelegate: AnyObject {
    func didTapUserProfile()
    func didTapPostOption()
}

final class CommunityCellProfileView: UIView {
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
    
    private let postOptionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        return button
    }()
    
    weak var delegate: CommunityCellProfileViewDelegate?
    
    init() {
        super.init(frame: .zero)
        configureSubview()
        configureLayout()
        configureAction()
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
extension CommunityCellProfileView {
    private func configureAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapUserProfile))
        profileImageView.addGestureRecognizer(tapGesture)
        profileIdLabel.addGestureRecognizer(tapGesture)
        
        postOptionButton.addTarget(self, action: #selector(tapOptionButton), for: .touchUpInside)
    }
    
    @objc
    private func tapUserProfile() {
        delegate?.didTapUserProfile()
    }
    
    @objc
    private func tapOptionButton() {
        delegate?.didTapPostOption()
    }
}

// MARK: Configure UI
extension CommunityCellProfileView {
    private func configureSubview() {
        [profileImageView, profileIdLabel, postOptionButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: profileImageView Constraint
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
            
            // MARK: postOptionButton Constraint
            postOptionButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -15
            ),
            postOptionButton.widthAnchor.constraint(
                equalTo: postOptionButton.heightAnchor
            ),
            postOptionButton.heightAnchor.constraint(
                equalTo: safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.3
            ),
            postOptionButton.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            ),
            
            // MARK: profileIdLabel Constraint
            profileIdLabel.leadingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor,
                constant: 15
            ),
            profileIdLabel.trailingAnchor.constraint(
                equalTo: postOptionButton.leadingAnchor,
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
