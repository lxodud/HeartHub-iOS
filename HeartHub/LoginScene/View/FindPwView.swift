//
//  FindPwView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/24.
//

import UIKit

final class FindPwView: UIView {

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
    
    // 이메일 입력 텍스트필드
    lazy var emailEnterTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.attributedPlaceholder = NSAttributedString(
                string: "이메일을 입력하세요.",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 16)!
                            ])
        tf.textAlignment = .left
        return tf
    }()
    
    // 이메일 입력 텍스트필드 뷰
    private lazy var emailEnterTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(emailEnterTextField)
        return view
    }()
    
    // 비밀번호 찾기 버튼
    lazy var findPwBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitle("비밀번호 찾기", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-SemiBold", size: 16)
        button.setTitleColor(UIColor(red: 0.98, green: 0.18, blue: 0.74, alpha: 1), for: .normal)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    // 아이디 + 비밀번호 + 로그인 버튼 스택뷰
    private lazy var idEmailFindPwBtnStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [idEnterTextFieldView, emailEnterTextFieldView, findPwBtn])
        stview.spacing = 8
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        stview.setCustomSpacing(20, after: emailEnterTextFieldView)
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
    
    // 로그인 버튼
    lazy var loginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("로그인", for: .normal)
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
    lazy var findIdSignUpLoginBtnStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [findIdBtn, lineView1, signUpBtn, lineView2, loginBtn])
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
         idEmailFindPwBtnStackView,
         findIdSignUpLoginBtnStackView].forEach { addSubview($0) }
    }
    
    func setup() {
        idEnterTextField.delegate = self
        emailEnterTextField.delegate = self
    }
    
    func constraints() {
        backgroundViewConstraints()
        mountainBackgroundViewConstraints()
        LoginMountainFrontViewConstraints()
        heartHubMainLabelImageViewConstraints()
        heartImageViewConstraints()
        idEnterTextFieldConstraints()
        pwEnterTextFieldConstraints()
        idEmailFindPwBtnStackViewConstraints()
        findIdSignUpLoginBtnStackViewConstraints()
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
    
    private func idEmailFindPwBtnStackViewConstraints() {
        idEmailFindPwBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idEmailFindPwBtnStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            idEmailFindPwBtnStackView.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 49.62),
            idEmailFindPwBtnStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 59),
        ])
    }
    
    private func findIdSignUpLoginBtnStackViewConstraints() {
        findIdSignUpLoginBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            findIdSignUpLoginBtnStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            findIdSignUpLoginBtnStackView.topAnchor.constraint(equalTo: idEmailFindPwBtnStackView.bottomAnchor, constant: 28),
            findIdSignUpLoginBtnStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 12),
            findIdSignUpLoginBtnStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 69),
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
        emailEnterTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        emailEnterTextField.topAnchor.constraint(equalTo: emailEnterTextFieldView.topAnchor, constant: 12),
        emailEnterTextField.bottomAnchor.constraint(equalTo: emailEnterTextFieldView.bottomAnchor, constant: -12),
        emailEnterTextField.leadingAnchor.constraint(equalTo: emailEnterTextFieldView.leadingAnchor, constant: 12),
        emailEnterTextField.trailingAnchor.constraint(equalTo: emailEnterTextFieldView.trailingAnchor, constant: -12),
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

extension FindPwView: UITextFieldDelegate {
    
    // 키보드 엔터키가 눌렸을때 (다음 동작을 허락할 것인지)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if idEnterTextField.text != "", emailEnterTextField.text != "", emailEnterTextField.text != "" {
            emailEnterTextField.resignFirstResponder()
            return true
        } else if idEnterTextField.text != "" {
            emailEnterTextField.becomeFirstResponder()
            return true
        }
            return false
        }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        idEnterTextField.resignFirstResponder()
        emailEnterTextField.resignFirstResponder()
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
        case emailEnterTextField:
            maxLength = 100
            allowedCharacterSet = CharacterSet(charactersIn:
                                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&'*+-/=?^_`{|}~.(),:;<>@")
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
