
//
//  SignUpViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/06.
//

import UIKit

class SignUpStartDateViewController: UIViewController {
    
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
        let signUpProfileVC = SignUpProfileViewController()
        
        self.navigationController?.pushViewController(signUpProfileVC, animated: true)
    }
   
}


