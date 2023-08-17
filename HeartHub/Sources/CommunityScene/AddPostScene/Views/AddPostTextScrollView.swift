//
//  AddPostTextScrollView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/17.
//

import UIKit

class AddPostTextScrollView: UIScrollView {

    private let contentView = UIView()
    
    private let addPostTextField: UITextField = {
       let textField = UITextField()
        textField.font = UIFont(name: "Pretendard-Regular", size: 16)
        textField.attributedPlaceholder = NSAttributedString(
            string: "문구를 입력해주세요",
            attributes: [
                NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5),
                .font: UIFont(name: "Pretendard-Regular", size: 16)!
            ]
        )
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure Layout
extension AddPostTextScrollView {
    
    private func configureSubViews() {
        [addPostTextField].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [contentView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: ContentView Constraints
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),

            // MARK: privacyTermLabel Constraints
            addPostTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addPostTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            addPostTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            addPostTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
    }
}
