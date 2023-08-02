//
//  CoupleSpaceMainButtonView.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/02.
//

import UIKit

final class CoupleSpaceMainButtonView: UIView {
    private let buttonImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        return label
    }()
    
    private let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 15
        return stackView
    }()
    
    init(image: UIImage?, title: String) {
        super.init(frame: .zero)
        configureInitialSetting()
        configureContents(image: image, title: title)
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure Action
extension CoupleSpaceMainButtonView {
    func addAction(_ target: Any,_ action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tapGesture)
    }
}

// MARK: Configure UI
extension CoupleSpaceMainButtonView {
    private func configureInitialSetting() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 20
    }
    
    private func configureContents(image: UIImage?, title: String) {
        buttonLabel.text = title
        buttonImageView.image = image
    }
    
    private func configureSubview() {
        [buttonImageView, buttonLabel].forEach {
            totalStackView.addArrangedSubview($0)
        }
        
        addSubview(totalStackView)
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            totalStackView.topAnchor.constraint(
                equalTo: safeArea.topAnchor,
                constant: 20
            ),
            totalStackView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            totalStackView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            totalStackView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor,
                constant: -20
            )
        ])
    }
}
