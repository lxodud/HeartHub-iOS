
//
//  SignUpViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/06.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let signUpStartDateView = SignUpStartDateView()
    
    override func loadView() {
        view = signUpStartDateView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }

    func addTarget() {
        signUpStartDateView.rightArrowBtn.addTarget(self, action: #selector(didTapRightArrowBtn), for: .touchUpInside)
    }
    
    @objc func didTapRightArrowBtn() {
        let signUp2VC = SignUpProfileViewController()
        signUp2VC.modalPresentationStyle = .fullScreen
        present(signUp2VC, animated: true, completion: nil)
    }
   
}


