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
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
    }
    
    @objc private func didTapFindIdButton() {
        
        let idPattern = #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"#
        let isVaildPattern = (findIdView.emailTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
        if isVaildPattern {
//            let heartHubModalVC = heartHubModalViewController()
//            heartHubModalVC.modalPresentationStyle = .formSheet
//            present(heartHubModalVC, animated: true, completion: nil)
            
            let findIdModalVC = FindIdPopUpViewController()
            findIdModalVC.modalPresentationStyle = .overFullScreen
            present(findIdModalVC, animated: true, completion: nil)
        } else {
            print("올바른 이메일 형식 x")
        }
    }
    
    @objc private func didTapSignUpButton() {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc private func didTapFindPwButton() {
        // let findPwVC = FindPwViewController()
        // present(findPwVC, animated: true, completion: nil)
    }
    

//    func showFindIdModalView() {
//        view.backgroundColor = .systemGray
//        let findIdModalView = findIdModalView()
//        findIdModalView.translatesAutoresizingMaskIntoConstraints = false
//
//        findIdModalView.backgroundColor = .white
//        findIdModalView.clipsToBounds = true
//        findIdModalView.layer.cornerRadius = 20
//        NSLayoutConstraint.activate([
//            findIdModalView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            findIdModalView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            findIdModalView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 153),
//            findIdModalView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
//        ])
//    }
}
