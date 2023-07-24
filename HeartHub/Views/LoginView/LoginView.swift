//
//  LoginView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/10.
//

import UIKit

class LoginView: UIView {

// MARK: 배경 + 하트브랜드
    // 백그라운드 화면
    private let backgroundView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "BackgroundGradient.png")
        return imgView
    }()
    
    // 백그라운드 산
    private let mountainBackgroundView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "MountainBackground.png")
        return imgView
    }()
    
    // 산이미지 앞에 gradient
    private let LoginMountainFrontView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "LoginMountainFront.png")
        return imgView
    }()
    
    // 메인하트 이미지
    private let heartImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "HeartBrand.png")
        return imgView
    }()
    
    // MARK: HeartHub main Label Image
    private let HeartHubMainLabelImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "HeartHubMainLabel")
        return imgView
    }()
    
    

// MARK: ID,PW 입력, 로그인 버튼
    // 아이디 입력 텍스트 필드
    private lazy var idEnterTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.attributedPlaceholder = NSAttributedString(
                string: "아이디를 입력하세요.",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 16)!
                            ])
        tf.textAlignment = .left
        return tf
    }()
    
    // 아이디 입력 텍스트필드 뷰
    private lazy var idEnterTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(idEnterTextField)
        return view
    }()
    
    // 비밀번호 입력 텍스트필드
    lazy var pwEnterTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.keyboardType = .default
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.attributedPlaceholder = NSAttributedString(
                string: "비밀번호를 입력하세요.",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 16)!
                            ])
        tf.textAlignment = .left
        return tf
    }()
    
    // 비밀번호 입력 텍스트필드 뷰
    private lazy var pwEnterTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(pwEnterTextField)
        return view
    }()
    
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
        let stview = UIStackView(arrangedSubviews: [idEnterTextFieldView, pwEnterTextFieldView, loginBtn])
        stview.spacing = 8
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        stview.setCustomSpacing(20, after: pwEnterTextFieldView)
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
    
    func addViews() {
        [backgroundView,
         mountainBackgroundView,
         LoginMountainFrontView,
         HeartHubMainLabelImageView,
         heartImageView,
         idPwLoginBtnStackView,
         signUpFindIdPwStackView].forEach { addSubview($0) }
    }
    
    func setup() {
        idEnterTextField.delegate = self
        pwEnterTextField.delegate = self
    }
    
    func constraints() {
        backgroundViewConstraints()
        mountainBackgroundViewConstraints()
        LoginMountainFrontViewConstraints()
        heartHubMainLabelImageViewConstraints()

        heartImageViewConstraints()
        idEnterTextFieldConstraints()
        pwEnterTextFieldConstraints()
        idPwLoginBtnStackViewConstraints()
        signUpFindIdPwStackViewConstraints()
        lineView1Constraints()
        lineView2Constraints()
    }
    
    private func backgroundViewConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func mountainBackgroundViewConstraints() {
        mountainBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mountainBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 557.76),
            mountainBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 6),
            mountainBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mountainBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func LoginMountainFrontViewConstraints() {
        LoginMountainFrontView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            LoginMountainFrontView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 363),
            LoginMountainFrontView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 6),
            LoginMountainFrontView.leadingAnchor.constraint(equalTo: leadingAnchor),
            LoginMountainFrontView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func heartHubMainLabelImageViewConstraints() {
        HeartHubMainLabelImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            HeartHubMainLabelImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            HeartHubMainLabelImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 202),
            HeartHubMainLabelImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 63),
        ])
    }

    private func heartImageViewConstraints() {
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartImageView.topAnchor.constraint(equalTo: HeartHubMainLabelImageView.bottomAnchor, constant: 33),
            heartImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
        ])
    }
    
    private func idPwLoginBtnStackViewConstraints() {
        idPwLoginBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idPwLoginBtnStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            idPwLoginBtnStackView.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 49.62),
            idPwLoginBtnStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 59),
        ])
    }
    
    private func signUpFindIdPwStackViewConstraints() {
        signUpFindIdPwStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpFindIdPwStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpFindIdPwStackView.topAnchor.constraint(equalTo: idPwLoginBtnStackView.bottomAnchor, constant: 28),
            signUpFindIdPwStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 12),
            signUpFindIdPwStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 69),
        ])
    }
    
    private func idEnterTextFieldConstraints() {
        idEnterTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idEnterTextField.topAnchor.constraint(equalTo: idEnterTextFieldView.topAnchor, constant: 12),
            idEnterTextField.bottomAnchor.constraint(equalTo: idEnterTextFieldView.bottomAnchor, constant: -12),
            idEnterTextField.leadingAnchor.constraint(equalTo: idEnterTextFieldView.leadingAnchor, constant: 12),
            idEnterTextField.trailingAnchor.constraint(equalTo: idEnterTextFieldView.trailingAnchor, constant: -12),
        ])
    }
    
    private func pwEnterTextFieldConstraints() {
        pwEnterTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        pwEnterTextField.topAnchor.constraint(equalTo: pwEnterTextFieldView.topAnchor, constant: 12),
        pwEnterTextField.bottomAnchor.constraint(equalTo: pwEnterTextFieldView.bottomAnchor, constant: -12),
        pwEnterTextField.leadingAnchor.constraint(equalTo: pwEnterTextFieldView.leadingAnchor, constant: 12),
        pwEnterTextField.trailingAnchor.constraint(equalTo: pwEnterTextFieldView.trailingAnchor, constant: -12),
        ])
    }
    
    private func lineView1Constraints() {
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView1.widthAnchor.constraint(equalToConstant: 1),
            lineView1.heightAnchor.constraint(equalTo: signUpBtn.heightAnchor, multiplier: 0.5)
        ])
    }

    private func lineView2Constraints() {
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
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
