//
//  CommunityCellBottomButtonView.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/11.
//

import UIKit

final class CommunityCellBottomButtonView: UIView {
    weak var delegate: CommunityCellBottomButtonViewDelegate?
    
    private let thumbButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        button.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .selected)
        return button
    }()
    
    private let thumbCountLabel: UILabel = {
        let label = UILabel()
        label.text = "하이"
        label.textColor = .black
        return label
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        return button
    }()
    
    private let commentCountLabel: UILabel = {
        let label = UILabel()
        label.text = "하이"
        label.textColor = .black
        return label
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        return stackView
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        configureAction()
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure Action
extension CommunityCellBottomButtonView {
    private func configureAction() {
        thumbButton.addTarget(
            self,
            action: #selector(tapThumbButton(_:)),
            for: .touchUpInside
        )
        commentButton.addTarget(
            self,
            action: #selector(tapCommentButton),
            for: .touchUpInside
        )
        heartButton.addTarget(
            self,
            action: #selector(tapHeartButton(_:)),
            for: .touchUpInside
        )
    }
    
    @objc
    private func tapThumbButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        delegate?.didTapThumbButton()
    }
    
    @objc
    private func tapCommentButton() {
        delegate?.didTapCommentButton()
    }
    
    @objc
    private func tapHeartButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        delegate?.didTapHeartButton()
    }
}

// MARK: Configure UI
extension CommunityCellBottomButtonView {
    private func configureSubview() {
        [thumbButton, thumbCountLabel, commentButton, commentCountLabel].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        [buttonStackView, heartButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: buttonStackView Constraint
            buttonStackView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 15
            ),
            buttonStackView.widthAnchor.constraint(
                greaterThanOrEqualTo: safeAreaLayoutGuide.widthAnchor,
                multiplier: 0.3
            ),
            buttonStackView.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            ),
            buttonStackView.heightAnchor.constraint(
                equalTo: safeAreaLayoutGuide.heightAnchor,
                multiplier: 1
            ),
            
            // MARK: heartButton Constraint
            heartButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -15
            ),
            heartButton.widthAnchor.constraint(
                equalTo: safeAreaLayoutGuide.widthAnchor,
                multiplier: 0.06
            ),
            heartButton.heightAnchor.constraint(
                equalTo: safeAreaLayoutGuide.heightAnchor,
                multiplier: 1
            ),
            heartButton.centerYAnchor.constraint(
                equalTo: safeAreaLayoutGuide.centerYAnchor
            )
        ])
    }
}
