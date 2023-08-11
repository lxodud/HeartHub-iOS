//
//  LoginView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/10.
//

import UIKit

final class LoginView: UIView {
    
    private let loginBackGroundView = LoginBackGroundView()
    
    private let idEnterTextField = LoginTextFieldView(
        placeholder: "아이디를 입력하세요",
        keyboardType: .emailAddress,
        isSecureTextEntry: false
    )
    
    private let pwEnterTextField = LoginTextFieldView(
        placeholder: "비밀번호를 입력하세요",
        keyboardType: .default,
        isSecureTextEntry: true
    )
    
    // 로그인 버튼
    lazy var loginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-SemiBold", size: 16)
        button.setTitleColor(UIColor(red: 0.98, green: 0.18, blue: 0.74, alpha: 1), for: .normal)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    // 아이디 + 비밀번호 + 로그인 버튼 스택뷰
    private lazy var idPwLoginBtnStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [idEnterTextField, pwEnterTextField, loginBtn])
        stview.spacing = 8
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        stview.setCustomSpacing(20, after: pwEnterTextField)
        return stview
    }()
    
// MARK: 아이디 찾기 + 회원가입 + 비밀번호찾기 버튼
    // 아이디 찾기 버튼
    lazy var findIdBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("아이디 찾기", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-Regular", size: 16)
        button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        return button
    }()
    
    // 회원가입 버튼
    lazy var signUpBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-Regular", size: 16)
        button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        return button
    }()
    
    // 비밀번호 찾기 버튼
    lazy var findPwBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("비밀번호 찾기", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-Regular", size: 16)
        button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        return button
    }()
    
    // 회원가입 닉네임 로그인 사이 선
    private lazy var lineView1: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        return view
    }()
    
    private lazy var lineView2: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        return view
    }()
    
    // 아이디찾기 + 선 + 회원가입 + 선 + 비밀번호 찾기 버튼 스택뷰
    lazy var signUpFindIdPwStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [findIdBtn, lineView1, signUpBtn, lineView2, findPwBtn])
        stView.spacing = 10
        stView.axis = .horizontal
        stView.distribution = .fillProportionally
        stView.alignment = .center
        return stView
    }()
    
    // MARK: 뷰 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        constraints()
        setup()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        [loginBackGroundView,
         idPwLoginBtnStackView,
         signUpFindIdPwStackView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setup() {
        idEnterTextField.delegate = self
        pwEnterTextField.delegate = self
    }
    
    private func constraints() {
        
        let safeArea = safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            // MARK: loginBackGrondView Constraints
            loginBackGroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginBackGroundView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginBackGroundView.topAnchor.constraint(equalTo: topAnchor),
            loginBackGroundView.leadingAnchor.constraint(equalTo: leadingAnchor),

            // MARK: ID, PW TextField, LoginButton StackView Constraints
            idPwLoginBtnStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            idPwLoginBtnStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            idPwLoginBtnStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 527),
            idPwLoginBtnStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 59),

            // MARK: SignUp button, FindID button, FindPw button StackView Constraints
            signUpFindIdPwStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpFindIdPwStackView.topAnchor.constraint(equalTo: idPwLoginBtnStackView.bottomAnchor, constant: 28),
            signUpFindIdPwStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 12),
            signUpFindIdPwStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 69),

            lineView1.widthAnchor.constraint(equalToConstant: 1),
            lineView1.heightAnchor.constraint(equalTo: signUpBtn.heightAnchor, multiplier: 0.5),

            lineView2.widthAnchor.constraint(equalToConstant: 1),
            lineView2.heightAnchor.constraint(equalTo: lineView1.heightAnchor)
        ])
    }
}

extension LoginView: UITextFieldDelegate {
    
    // 키보드 엔터키가 눌렸을때 (다음 동작을 허락할 것인지)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if idEnterTextField.text != "", pwEnterTextField.text != "", pwEnterTextField.text != "" {
            pwEnterTextField.resignFirstResponder()
            return true
        } else if idEnterTextField.text != "", pwEnterTextField.text != "" {
            pwEnterTextField.becomeFirstResponder()
            return true
        } else if idEnterTextField.text != "" {
            pwEnterTextField.becomeFirstResponder()
            return true
        }
            return false
        }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        idEnterTextField.resignFirstResponder()
        pwEnterTextField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        // 백스페이스 감지
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        
        guard let text = textField.text else {
            return true
        }
        
        let maxLength: Int
        var allowedCharacterSet: CharacterSet
        
        switch textField {
        case idEnterTextField:
            maxLength = 18
            allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        case pwEnterTextField:
            maxLength = 15
            allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_?+=~")

        default:
            return true
        }
        
        let newLength = text.count + string.count - range.length
        
        if newLength <= maxLength {
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacterSet.isSuperset(of: characterSet)
        } else {
            return false
        }
    }
    
}
