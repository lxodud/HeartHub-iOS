
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
        signupView.nextBtn.addTarget(self, action: #selector(didTapNextBtn), for: .touchUpInside)
    }
    
    @objc func didTapNextBtn() {
        let signUp2VC = SignUp2ViewController()
        present(signUp2VC, animated: true, completion: nil)
    }
   
}


