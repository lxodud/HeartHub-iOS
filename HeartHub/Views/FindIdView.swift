//
//  FindIdView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/16.
//

import UIKit

class FindIdView: UIView {
    let screenHeight = UIScreen.main.bounds.size.height

    // MARK: 배경 + 하트브랜드
    // 백그라운드 화면
    private let backgroundView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.image = UIImage(named: "BackgroundGradient.png")
        return imgView
    }()
    
    // 백그라운드 산
    private let mountainBackgroundView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.image = UIImage(named: "MountainBackground.png")
        return imgView
    }()
    
    // 산이미지 앞에 gradient
    private let LoginMountainFrontView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.image = UIImage(named: "LoginMountainFront.png")
        return imgView
    }()
    
    // 메인하트 이미지
    private let heartImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.image = UIImage(named: "HeartBrand.png")
        return imgView
    }()
    
    // MARK: HeartHub main Label
    // mainLabel
    private let heartHubLabel: UILabel = {
        let label = UILabel()
        label.text = "HeartHuB"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 60)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private let heartHubBackLabel: BlurredLabel = {
        let label = BlurredLabel()
        label.text = "HeartHuB"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 60)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = false
        label.textColor = #colorLiteral(red: 0.98, green: 0.18, blue: 0.74, alpha: 1)
        label.isBlurring = true
        return label
    }()
    
    // MARK: 이메일입력
    // 이메일 입력 텍스트 필드
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(
                string: "아이디를 입력하세요.",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 16)!
                            ])
        tf.textAlignment = .left
        return tf
    }()
    
    // 이메일 입력 텍스트필드 뷰
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(emailTextField)
        return view
    }()

    // 아이디 찾기
    lazy var findIdBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitle("아이디 찾기", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-SemiBold", size: 16)
        button.setTitleColor(UIColor(red: 0.98, green: 0.18, blue: 0.74, alpha: 1), for: .normal)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    // 이메일입력 + 아이디 찾기 버튼 스택뷰
    private lazy var emailTfFindIdBtnStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [emailTextFieldView, findIdBtn])
        stview.spacing = 47
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    // MARK: 아디디 찾기 + 회원가입 + 비밀번호찾기 버튼
    // 아이디 찾기 버튼
    lazy var unActivatedFindIdBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("아이디 찾기", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(red: 1, green: 0.758, blue: 0.918, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-Regular", size: 16)
       // button.sizeToFit()
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
       // button.sizeToFit()
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
       // button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        return button
    }()
    
    // 회원가입 닉네임 로그인 사이 선
    private lazy var lineView1: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        return line
    }()
    
    private lazy var lineView2: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        return line
    }()
    
    // 아이디찾기 + 선 + 회원가입 + 선 + 비밀번호 찾기 버튼 스택뷰
    lazy var signUpFindIdPwStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [unActivatedFindIdBtn, lineView1, signUpBtn, lineView2, findPwBtn])
        stView.spacing = 10
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .center
        return stView
    }()
    
    // MARK: 뷰 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        constraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        [backgroundView,
         mountainBackgroundView,
         LoginMountainFrontView,
         heartHubBackLabel,
         heartHubLabel,
         heartImageView,
         emailTfFindIdBtnStackView,
         signUpFindIdPwStackView].forEach { addSubview($0) }
    }
    
    func constraints() {
        backgroundViewConstraints()
        mountainBackgroundViewConstraints()
        LoginMountainFrontViewConstraints()
        heartHubBackLabelConstraints()
        heartHubLabelConstraints()
        heartImageViewConstraints()
        emailTextFieldConstraints()
        emailTextFieldViewConstraints()
        findIdBtnConstraints()
        emailTfFindIdStackViewConstraints()
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
            mountainBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 558),
            mountainBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 37),
            mountainBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -15),
            mountainBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 113)
        ])
    }
    private func LoginMountainFrontViewConstraints() {
        LoginMountainFrontView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            LoginMountainFrontView.topAnchor.constraint(equalTo: topAnchor, constant: 422),
            LoginMountainFrontView.bottomAnchor.constraint(equalTo: bottomAnchor),
            LoginMountainFrontView.leadingAnchor.constraint(equalTo: leadingAnchor),
            LoginMountainFrontView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    private func heartHubBackLabelConstraints() {
        heartHubBackLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartHubBackLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartHubBackLabel.topAnchor.constraint(equalTo: topAnchor, constant: 261),
            heartHubBackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 63),
            heartHubBackLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -61),
        ])
    }
    private func heartHubLabelConstraints() {
        heartHubLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartHubLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartHubLabel.topAnchor.constraint(equalTo: topAnchor, constant: 261),
            heartHubLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 63),
            heartHubLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -63)
        ])
    }
    private func heartImageViewConstraints() {
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImageView.topAnchor.constraint(equalTo: heartHubLabel.bottomAnchor, constant: 33),
            heartImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            heartImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60)
            
        ])
    }
    
    private func emailTfFindIdStackViewConstraints() {
        emailTfFindIdBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTfFindIdBtnStackView.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 49.62),
            emailTfFindIdBtnStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 59),
            emailTfFindIdBtnStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -59),
        ])
    }
    
    private func emailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 12),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -12),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 12),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -12),
        ])
    }
    
    
    private func emailTextFieldViewConstraints() {
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextFieldView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 48 / screenHeight)
        ])
    }
    
    private func findIdBtnConstraints() {
        findIdBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            findIdBtn.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 48 / screenHeight)
        ])
    }
    
    private func signUpFindIdPwStackViewConstraints() {
        signUpFindIdPwStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpFindIdPwStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpFindIdPwStackView.topAnchor.constraint(equalTo: emailTfFindIdBtnStackView.bottomAnchor, constant: 28),
//            signUpFindIdPwStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -46),
            signUpFindIdPwStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 69),
            signUpFindIdPwStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -69),
        ])
    }
    
    private func lineView1Constraints() {
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView1.widthAnchor.constraint(equalToConstant: 1),
            lineView1.topAnchor.constraint(equalTo: signUpFindIdPwStackView.topAnchor, constant: 8),
            lineView1.bottomAnchor.constraint(equalTo: signUpFindIdPwStackView.bottomAnchor, constant: -8),
            lineView1.leadingAnchor.constraint(equalTo: unActivatedFindIdBtn.trailingAnchor, constant: 10),
            lineView1.trailingAnchor.constraint(equalTo: signUpBtn.leadingAnchor, constant: -10)
        ])
    }
    
    private func lineView2Constraints() {
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView2.widthAnchor.constraint(equalToConstant: 1),
            lineView2.topAnchor.constraint(equalTo: signUpFindIdPwStackView.topAnchor, constant: 8),
            lineView2.bottomAnchor.constraint(equalTo: signUpFindIdPwStackView.bottomAnchor, constant: -8),
            lineView2.leadingAnchor.constraint(equalTo: signUpBtn.trailingAnchor, constant: 10),
            lineView2.trailingAnchor.constraint(equalTo: findPwBtn.leadingAnchor, constant: -10)
        ])
    }
}
