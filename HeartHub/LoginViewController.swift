//
//  LoginViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/07.
//

// 이슈 : 버튼 타이틀 폰트 크기 자동으로 조정 어떻게 함?

import UIKit

final class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
        
    }
    
    func setupAddTarget() {
        loginView.idLoginBtn.addTarget(self, action: #selector(didTapIdLoginButton), for: .touchUpInside)
        loginView.emailLoginBtn.addTarget(self, action: #selector(didTapEmailLoginButton), for: .touchUpInside)
        loginView.signUpBtn.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        loginView.nicknameLoginBtn.addTarget(self, action: #selector(didTapNicknameLoginButton), for: .touchUpInside)

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
