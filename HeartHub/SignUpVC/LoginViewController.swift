//
//  LoginViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/07.
//

// 이슈 : 버튼 타이틀 폰트 크기 자동으로 조정 어떻게 함?

import UIKit

class LoginViewController: UIViewController {
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
    private lazy var idLoginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        button.setTitle("아이디로 로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentVerticalAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(didTapIdLoginButton), for: .touchUpInside)
       
        let image = UIImage(named: "IdLoginIcon.png")
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    

    
    // 이메일 로그인 버튼
    private lazy var emailLoginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        button.setTitle("이메일로 로그인", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "PretendardVariable", size: 16)
        button.addTarget(self, action: #selector(didTapEmailLoginButton), for: .touchUpInside)
        
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
    private lazy var signUpBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "PretendardVariable", size: 16)
        button.sizeToFit()
        button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        return button
    }()
    
    // 닉네임으로 로그인 버튼
    // 버튼 타이틀이 한 줄에 다 안뜸
    private lazy var nicknameLoginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("닉네임으로 로그인", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "PretendardVariable", size: 16)
        button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        button.addTarget(self, action: #selector(didTapNicknameLoginButton), for: .touchUpInside)
        return button
    }()
    
    // 회원가입 닉네임 로그인 사이 선
    private lazy var lineView: UIView = {
       let line = UIView()
        line.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
        return line
    }()
    
    // 회원가입 + 선 + 닉네임으로 로그인 버튼 스택뷰
    private lazy var signUpNicknameStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [signUpBtn, lineView, nicknameLoginBtn])
        stView.spacing = 10
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAutoLayout()
    }

    func setupAutoLayout() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        mountainBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        LoginMountainFrontView.translatesAutoresizingMaskIntoConstraints = false
        heartHubLabel.translatesAutoresizingMaskIntoConstraints = false
        heartHubBackLabel.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
       

        
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        signUpNicknameStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundView)
        view.addSubview(mountainBackgroundView)
        view.addSubview(LoginMountainFrontView)
        view.addSubview(heartHubBackLabel)
        view.addSubview(heartHubLabel)
        view.addSubview(heartImageView)
        
        view.addSubview(loginStackView)
        view.addSubview(signUpNicknameStackView)

        
        // let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            mountainBackgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 558),
            mountainBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 37),
            mountainBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -15),
            mountainBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 113),
            
            LoginMountainFrontView.topAnchor.constraint(equalTo: view.topAnchor, constant: 422),
            LoginMountainFrontView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            LoginMountainFrontView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            LoginMountainFrontView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            heartHubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heartHubLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 261),
            heartHubLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -532),
            heartHubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 63),
            heartHubLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -63),

            heartHubBackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heartHubBackLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 261),
            heartHubBackLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -532),
            heartHubBackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 63),
            heartHubBackLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -61),
            
            heartImageView.topAnchor.constraint(equalTo: heartHubLabel.bottomAnchor, constant: 33),
            heartImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            heartImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            
            loginStackView.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 85.62),
            loginStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
            loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 59),
            loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -59),
            
            
            lineView.widthAnchor.constraint(equalToConstant: 1),
            lineView.topAnchor.constraint(equalTo: signUpNicknameStackView.topAnchor, constant: 4),
            lineView.bottomAnchor.constraint(equalTo: signUpNicknameStackView.bottomAnchor, constant: -4),
            lineView.leadingAnchor.constraint(equalTo: signUpBtn.trailingAnchor, constant: 10),
            lineView.trailingAnchor.constraint(equalTo: nicknameLoginBtn.leadingAnchor, constant: -10),
            
            signUpNicknameStackView.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 36),
            signUpNicknameStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            signUpNicknameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 102),
            signUpNicknameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -101)


        ])
        
    }
    
    @objc private func didTapIdLoginButton() {
        // 아이디로로 로그인 버튼을 눌렀을 때의 동작 정의
        print("아이디 로그인 버튼이 눌렸습니다.")
    }
    
    @objc private func didTapEmailLoginButton() {
        // 이메일로로 로그인 버튼을 눌렀을 때의 동작 정의
        print("이메일 로그인 버튼이 눌렸습니다.")
    }
    
    @objc private func didTapSignUpButton() {
        let signUpVC = SignUpViewController()
        present(signUpVC, animated: true, completion: nil)
    }
    @objc private func didTapNicknameLoginButton() {
        // 닉네임으로 로그인 버튼을 눌렀을 때의 동작 정의
        print("닉네임으로 로그인 버튼이 눌렸습니다.")
    }
}
