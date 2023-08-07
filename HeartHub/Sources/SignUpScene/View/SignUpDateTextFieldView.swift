//
//  SignUpBirthDateTextFieldView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/07.
//

import UIKit

final class SignUpDateTextFieldView: UITextField {

    private var signUpDateTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.attributedPlaceholder = NSAttributedString(
            string: "YYYY",
            attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5),
                         NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 14)!
                        ])
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .numberPad
        tf.placeholder = "YYYY"
        tf.textAlignment = .center
        return tf
    }()
    
    // 시작 년도 뷰
    private lazy var signUpYearTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(signUpDateTextField)
        return view
    }()
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        signUpDateTextField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5),
                         NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 14)!
                        ])
        
        configureSubviews()
        configureLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignUpDateTextFieldView {
    private func configureSubviews() {
         addSubview(signUpYearTextFieldView)
        [signUpYearTextFieldView,
         signUpDateTextField].forEach { $0.translatesAutoresizingMaskIntoConstraints = false}
    }
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            // MARK: signUpDateStackView Constraints
            signUpYearTextFieldView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpYearTextFieldView.centerYAnchor.constraint(equalTo: centerYAnchor),
            signUpYearTextFieldView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            signUpYearTextFieldView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            
            // MARK: signUpYearTextField Constraints
            signUpDateTextField.centerXAnchor.constraint(equalTo: signUpYearTextFieldView.centerXAnchor),
            signUpDateTextField.centerYAnchor.constraint(equalTo: signUpYearTextFieldView.centerYAnchor),
            signUpDateTextField.topAnchor.constraint(equalTo: signUpYearTextFieldView.topAnchor, constant: 7),
            signUpDateTextField.leadingAnchor.constraint(equalTo: signUpYearTextFieldView.leadingAnchor, constant: 21)
        ])
    }
}

