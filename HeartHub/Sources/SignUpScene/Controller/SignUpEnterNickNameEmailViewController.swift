//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit
import DropDown

final class SignUpEnterNickNameEmailViewController: UIViewController {
    
    private let signUpLoverLinkingView = SignUpEnterNickNameEmailView()
    private let userInformationManager: UserInformationManager
    
    init(userInformationManager: UserInformationManager) {
        self.userInformationManager = userInformationManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = signUpLoverLinkingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddTarget()
    }
}

// MARK: Configure AddTarget
extension SignUpEnterNickNameEmailViewController {
    private func configureAddTarget() {
        signUpLoverLinkingView.signUpLoverNextPageButton.addTarget(self, action: #selector(didTapNextPageButton), for: .touchUpInside)
        signUpLoverLinkingView.signUpLoverPreviousPageButton.addTarget(self, action: #selector(didTapPreviousPageButton), for: .touchUpInside)
        signUpLoverLinkingView.emailVerifyButton.addTarget(self, action: #selector(didTapemailVerifyButton), for: .touchUpInside)
        signUpLoverLinkingView.nickNameCheckButton.addTarget(self, action: #selector(didTapNickNameCheckButton), for: .touchUpInside)
    }
    
    @objc private func didTapNickNameCheckButton() {
        
    }
    
    @objc private func didTapNextPageButton() {
        let signUpTermAgreeVC = SignUpTermAgreeViewController()
        navigationController?.pushViewController(signUpTermAgreeVC, animated: true)
    }
    
    @objc private func didTapPreviousPageButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapemailVerifyButton() {
        guard let email = signUpLoverLinkingView.emailTextField.text else {
            return
        }
        
        userInformationManager.sendVerificationCodeToEmail(with: email)
    }
}
