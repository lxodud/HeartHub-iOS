//
//  ProfileUserView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/01.
//

import UIKit

final class ProfileUserView: UIView {

    private lazy var imageShadowView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1.0
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4
        view.addSubview(profileImageView)
        return view
    }()
    
    var profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var profileNickNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.init(name: "Pretendard-SemiBold", size: 20)
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    var profileInformationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.init(name: "Pretendard-Regular", size: 16)
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    var profileLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure UI
extension ProfileUserView {
   
    private func configureSubview() {
        [profileNickNameLabel, profileInformationLabel].forEach {
            profileLabelStackView.addArrangedSubview($0)
        }
        
        [imageShadowView, profileLabelStackView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
        
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: imageShadowView Constraints
            imageShadowView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.7),
            imageShadowView.widthAnchor.constraint(equalTo: imageShadowView.heightAnchor),
            imageShadowView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageShadowView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageShadowView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 95),
            
            // MARK: ProfileImageView Constraints
            profileImageView.topAnchor.constraint(equalTo: imageShadowView.topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: imageShadowView.bottomAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: imageShadowView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: imageShadowView.trailingAnchor),

            // MARK: profileLabelStackView Constraints
            profileLabelStackView.topAnchor.constraint(equalTo: imageShadowView.bottomAnchor, constant: 16),
            profileLabelStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            profileLabelStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
