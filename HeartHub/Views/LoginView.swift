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
        // 폰트 수정 필요
        label.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        label.textAlignment = .center
        //label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private let heartHubBackLabel: BlurredLabel = {
        let label = BlurredLabel()
        label.font = UIFont.systemFont(ofSize: 60, weight: .semibold)
        label.textColor = #colorLiteral(red: 0.98, green: 0.18, blue: 0.74, alpha: 1)
        label.text = "HeartHuB"
        label.clipsToBounds = false
        label.isBlurring = true
        return label
    }()
    
    // MARK: 버튼
    // 아이디 로그인 버튼
    lazy var idLoginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        button.setTitle("아이디로 로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentVerticalAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        let image = UIImage(named: "IdLoginIcon.png")
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    // 이메일 로그인 버튼
    lazy var emailLoginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        button.setTitle("이메일로 로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "PretendardVariable", size: 16)
        
        let image = UIImage(named: "EmailLoginIcon.png")
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }()
    
    // 아이디 + 이메일 로그인 버튼 스택뷰
    private lazy var loginStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [idLoginBtn, emailLoginBtn])
        stview.spacing = 8
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    // 회원가입 버튼
    lazy var signUpBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "PretendardVariable", size: 16)
        button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        return button
    }()
    
    // 닉네임으로 로그인 버튼
    // 버튼 타이틀이 한 줄에 다 안뜸
    lazy var nicknameLoginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("닉네임으로 로그인", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "PretendardVariable", size: 16)
        button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        return button
    }()
    
    // 회원가입 닉네임 로그인 사이 선
    private lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        return line
    }()
    
    // 회원가입 + 선 + 닉네임으로 로그인 버튼 스택뷰
    lazy var signUpNicknameStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [signUpBtn, lineView, nicknameLoginBtn])
        stView.spacing = 10
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
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
         loginStackView,
         signUpNicknameStackView].forEach { addSubview($0) }
    }
    
    func constraints() {
        backgroundViewConstraints()
        mountainBackgroundViewConstraints()
        LoginMountainFrontViewConstraints()
        heartHubBackLabelConstraints()
        heartHubLabelConstraints()
        heartImageViewConstraints()
        loginStackViewConstraints()
        signUpNicknameStackViewConstraints()
        lineViewConstraints()
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
            heartHubBackLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -532),
            heartHubBackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 63),
            heartHubBackLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -61),
        ])
    }
    private func heartHubLabelConstraints() {
        heartHubLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartHubLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartHubLabel.topAnchor.constraint(equalTo: topAnchor, constant: 261),
            heartHubLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -532),
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
    private func loginStackViewConstraints() {
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 85.62),
            loginStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
            loginStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 59),
            loginStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -59)
        ])
    }
    private func signUpNicknameStackViewConstraints() {
        signUpNicknameStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpNicknameStackView.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 36),
            signUpNicknameStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            signUpNicknameStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 102),
            signUpNicknameStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -101)
            
        ])
    }
    
    private func lineViewConstraints() {
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.widthAnchor.constraint(equalToConstant: 1),
            lineView.topAnchor.constraint(equalTo: signUpNicknameStackView.topAnchor, constant: 4),
            lineView.bottomAnchor.constraint(equalTo: signUpNicknameStackView.bottomAnchor, constant: -4),
            lineView.leadingAnchor.constraint(equalTo: signUpBtn.trailingAnchor, constant: 10),
            lineView.trailingAnchor.constraint(equalTo: nicknameLoginBtn.leadingAnchor, constant: -10)
        ])
    }
    
    
}
