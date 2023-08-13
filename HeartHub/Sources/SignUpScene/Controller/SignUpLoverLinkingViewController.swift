//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit
import DropDown

final class SignUpLoverLinkingViewController: UIViewController {
    
    private let signUpLoverLinkingView = SignUpLoverLinkingView()
    
    override func loadView() {
        view = signUpLoverLinkingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureAddTarget()
        
    }
}

// MARK: Configure AddTarget
extension SignUpLoverLinkingViewController {
    private func ConfigureAddTarget() {
        signUpLoverLinkingView.signUpLoverNextPageButton.addTarget(self, action: #selector(didTapnextPageButton), for: .touchUpInside)
        signUpLoverLinkingView.signUpLoverPreviousPageButton.addTarget(self, action: #selector(didTappreviousPageButton), for: .touchUpInside)
        signUpLoverLinkingView.emailVerifyButton.addTarget(self, action: #selector(didTapemailVerifyButton), for: .touchUpInside)
    }
    
    @objc private func didTapnextPageButton() {
        let signUpTermAgreeVC = SignUpTermAgreeViewController()
        navigationController?.pushViewController(signUpTermAgreeVC, animated: true)
    }
    
    @objc private func didTappreviousPageButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapemailVerifyButton() {
        
    }
}
