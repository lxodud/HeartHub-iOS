
//
//  SignUpViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/06.
//

import UIKit

final class SignUpStartDateViewController: UIViewController {
    
    private let signUpStartDateView = SignUpStartDateView()
    
    override func loadView() {
        view = signUpStartDateView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }

    func addTarget() {
        signUpStartDateView.nextPageButton.addTarget(self, action: #selector(didTapNextPageButton), for: .touchUpInside)
        signUpStartDateView.previousPageButton.addTarget(self, action: #selector(didTapPreviousPageButton), for: .touchUpInside)
    }
    
    @objc func didTapNextPageButton() {
        let signUpProfileVC = SignUpProfileViewController()
        self.navigationController?.pushViewController(signUpProfileVC, animated: true)
    }
    
    @objc func didTapPreviousPageButton() {
        let LoginVC = LoginViewController()
        self.navigationController?.pushViewController(LoginVC, animated: true)
    }
   
}


