
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
        signUpStartDateView.signUpStartDateNextPageButton.addTarget(self, action: #selector(didTapNextPageButton), for: .touchUpInside)
        signUpStartDateView.signUpStartDatePreviousPageButton.addTarget(self, action: #selector(didTapPreviousPageButton), for: .touchUpInside)
    }
    
    @objc func didTapNextPageButton() {
        let signUpProfileViewController = SignUpProfileViewController()
        self.navigationController?.pushViewController(signUpProfileViewController, animated: true)
    }
    
    @objc func didTapPreviousPageButton() {
        navigationController?.popViewController(animated: true)
    }
   
}


