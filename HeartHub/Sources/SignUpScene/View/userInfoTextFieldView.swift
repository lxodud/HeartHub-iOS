//
//  userInfoTextFieldView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/07.
//

import UIKit

final class userInfoTextFieldView: UITextField {

    private var userInfoTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.font = UIFont(name: "Pretendard-Regular", size: 14)
        tf.textAlignment = .left
        return tf
    }()
    
    private lazy var userInfoTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(userInfoTextField)
        return view
    }()
    
    init(placeholder: String, keyboardType: UIKeyboardType, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        
        userInfoTextField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)]
        )
        userInfoTextField.keyboardType = keyboardType
        userInfoTextField.isSecureTextEntry = isSecureTextEntry

        configureSubviews()
        configureLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension userInfoTextFieldView {
    private func configureSubviews() {
         addSubview(userInfoTextFieldView)
        [userInfoTextFieldView,
         userInfoTextField].forEach { $0.translatesAutoresizingMaskIntoConstraints = false}
    }
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            // MARK: signUpDateStackView Constraints
            userInfoTextFieldView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userInfoTextFieldView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userInfoTextFieldView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            userInfoTextFieldView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
           
            // MARK: userInfoTextField Constraints
            userInfoTextField.centerXAnchor.constraint(equalTo: userInfoTextFieldView.centerXAnchor),
            userInfoTextField.centerYAnchor.constraint(equalTo: userInfoTextFieldView.centerYAnchor),
            userInfoTextField.topAnchor.constraint(equalTo: userInfoTextFieldView.topAnchor, constant: 6),
            userInfoTextField.leadingAnchor.constraint(equalTo: userInfoTextFieldView.leadingAnchor, constant: 27),
            userInfoTextField.trailingAnchor.constraint(equalTo: userInfoTextFieldView.trailingAnchor, constant: -73)
        ])
    }
}


