
//
//  SignUpViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/06.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let signupView = SignUpView()
    
    override func loadView() {
        view = signupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }

    func addTarget() {
        signupView.rightArrowBtn.addTarget(self, action: #selector(didTapRightArrowBtn), for: .touchUpInside)
    }
    
    @objc func didTapRightArrowBtn() {
        let signUp2VC = SignUp2ViewController()
        signUp2VC.modalPresentationStyle = .fullScreen
        present(signUp2VC, animated: true, completion: nil)
    }
   
}


