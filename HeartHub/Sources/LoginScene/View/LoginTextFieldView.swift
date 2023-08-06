//
//  LoginTextFieldView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/07.
//

import UIKit

class LoginTextFieldView: UITextField {

        private let loginTextField: UITextField = {
            var tf = UITextField()
            tf.backgroundColor = .clear
            tf.textColor = .white
            tf.autocapitalizationType = .none
            tf.autocorrectionType = .no
            tf.spellCheckingType = .no
            tf.clearsOnBeginEditing = false
            tf.font = UIFont(name: "Pretendard-Regular", size: 16)
            tf.textAlignment = .left
            return tf
        }()
        
        // 아이디 입력 텍스트필드 뷰
        private lazy var loginTextFieldView: UIView = {
            let view = UIView()
            view.backgroundColor = .clear
            view.clipsToBounds = true
            view.layer.cornerRadius = 8
            view.layer.borderColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
            view.layer.borderWidth = 1
            view.addSubview(loginTextField)
            return view
        }()
    
    init(placeholder: String, keyboardType: UIKeyboardType, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        loginTextField.keyboardType = keyboardType
        loginTextField.isSecureTextEntry = isSecureTextEntry
        
        configureSubviews()
        configureLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginTextFieldView {
    private func configureSubviews() {
         addSubview(loginTextFieldView)
        loginTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: loginTextFieldView Constraints
            loginTextFieldView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginTextFieldView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginTextFieldView.topAnchor.constraint(equalTo: topAnchor),
            loginTextFieldView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            // MARK: loginTextFieldView Constraints
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginTextField.topAnchor.constraint(equalTo: loginTextFieldView.topAnchor, constant: 12),
            loginTextField.leadingAnchor.constraint(equalTo: loginTextFieldView.leadingAnchor, constant: 12),
        ])
    }
}
