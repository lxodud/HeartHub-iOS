//
//  LoginViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/07.
//

// 이슈 : 버튼 타이틀 폰트 크기 자동으로 조정 어떻게 함?

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
        
    }
    
    func setupAddTarget() {
        loginView.loginBtn.addTarget(self, action: #selector(didTapFindIdButton), for: .touchUpInside)
        loginView.findIdBtn.addTarget(self, action: #selector(didTapFindIdButton), for: .touchUpInside)
        loginView.signUpBtn.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        loginView.findPwBtn.addTarget(self, action: #selector(didTapFindPwButton), for: .touchUpInside)
    }

    
    @objc private func didTapLoginButton() {
        // 로그인 버튼을 눌렀을 때의 동작 정의
        print("로그인 버튼이 눌렸습니다.")
    }
    
    @objc private func didTapFindPwButton() {
        // let findPwVC = FindPwViewController()
        // present(findPwVC, animated: true, completion: nil)
    }
    
    @objc private func didTapSignUpButton() {
        let signUpVC = SignUpViewController()
        present(signUpVC, animated: true, completion: nil)
    }
    @objc private func didTapFindIdButton() {
        // let findIdVC = FindIdViewController()
        // present(findIdVC, animated: true, completion: nil)
        
    }
}
