//
//  FindIdViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/16.
//

import UIKit

class FindIdViewController: UIViewController {

    private let findIdView = FindIdView()
    
    override func loadView() {
        view = findIdView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
        
    }
    
    func setupAddTarget() {
        findIdView.findIdBtn.addTarget(self, action: #selector(didTapFindIdButton), for: .touchUpInside)
        findIdView.signUpBtn.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        findIdView.findPwBtn.addTarget(self, action: #selector(didTapFindPwButton), for: .touchUpInside)
        findIdView.loginBtn.addTarget(self, action: #selector(didTaploginBtn), for: .touchUpInside)

    }

    @objc private func didTaploginBtn() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    @objc private func didTapFindIdButton() {
        
        let idPattern = #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"#
        let isVaildPattern = (findIdView.emailTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
        if isVaildPattern {
            let findIdModalVC = FindIdPopUpViewController()
            navigationController?.pushViewController(findIdModalVC, animated: true)
        } else {
            print("올바른 이메일 형식 x")
        }
    }
    
    @objc private func didTapSignUpButton() {
        let signUpVC = SignUpStartDateViewController()
        
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @objc private func didTapFindPwButton() {
         let findPwVC = FindPwViewController()
        
        navigationController?.pushViewController(findPwVC, animated: true)
    }
}
