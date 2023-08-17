//
//  AddPostView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/16.
//

import UIKit

final class AddPostView: UIView {
    let postImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "TestImage")
        return imageView
    }()
    
    private var addPostProfileView = CommunityProfileView()
    
    private let addPostTextField: UITextField = {
       let textField = UITextField()
        textField.font = UIFont(name: "Pretendard-Regular", size: 16)
        textField.attributedPlaceholder = NSAttributedString(
            string: "문구를 입력해주세요",
            attributes: [
                NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5),
                .font: UIFont(name: "Pretendard-Regular", size: 16)!
//                .baselineOffset: NSNumber(value: 150)
            ]
        )
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        return textField
    }()
    
    var addPostDailyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Daily", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    var addPostLookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Daily", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        button.backgroundColor = .white
        button.titleLabel?.textColor = .black
        return button
    }()
    
    var addPostDateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Daily", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        return button
    }()
    
    private let addPostButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addPostDailyButton.layer.cornerRadius = addPostDailyButton.frame.height * CGFloat(0.392)
        addPostDateButton.layer.cornerRadius = addPostDateButton.frame.height * CGFloat(0.392)
        addPostLookButton.layer.cornerRadius = addPostLookButton.frame.height * CGFloat(0.392)
    }
}

// MARK: Configure Layout
extension AddPostView {
    
    private func configureSubviews() {
        [addPostDailyButton, addPostLookButton, addPostDateButton].forEach {
            addPostButtonStackView.addArrangedSubview($0)
        }
        
        [postImageView,
         addPostProfileView,
         addPostTextField].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // MARK: postImageView Constraints
            postImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.462),
            postImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            postImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),

            // MARK: addPostProfileView Constraints
            addPostProfileView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.077),
            addPostProfileView.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            addPostProfileView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25),
            addPostProfileView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),

            // MARK: addPostTextField Constraints
            addPostTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.246),
            addPostTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            addPostTextField.topAnchor.constraint(equalTo: addPostProfileView.bottomAnchor),
            addPostTextField.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            addPostTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
        ])
    }
}

extension AddPostView: UIGestureRecognizerDelegate {
    func configureTapPostImageAction(_ target: Any, _ action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.delegate = self
        postImageView.isUserInteractionEnabled = true
        postImageView.addGestureRecognizer(tapGesture)
    }
}
