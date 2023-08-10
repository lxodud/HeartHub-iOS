//
//  userInfoTextFieldView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/07.
//

import UIKit

final class SignUpUserInfoTextField: UITextField {
    
    private let insets: UIEdgeInsets = UIEdgeInsets(top: 6, left: 27, bottom: 6, right: 90)
    
    init(placeholder: String, keyboardType: UIKeyboardType, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)]
        )
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecureTextEntry
        
        configureUserInfoTextField()
        configureLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }

}

// MARK: Configure TextField
extension SignUpUserInfoTextField {
    private func configureUserInfoTextField() {
        backgroundColor = .clear
        textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        autocapitalizationType = .none
        autocorrectionType = .no
        spellCheckingType = .no
        font = UIFont(name: "Pretendard-Regular", size: 14)
        textAlignment = .left
        
        clipsToBounds = true
        layer.cornerRadius = 18
        layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        layer.borderWidth = 1
    }
}

// MARK: Configure Layout
extension SignUpUserInfoTextField {
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // MARK: userInfoTextField Constraints
            self.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 6),
            self.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 27),
            self.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -73)
        ])
    }
}


