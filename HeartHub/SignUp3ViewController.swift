//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit

class SignUp3ViewController: UIViewController {

    private let signUp3View = SignUp3View()

    override func loadView() {
        view = signUp3View
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()

    }
    
    func addTarget() {
        signUp3View.nextBtn.addTarget(self, action: #selector(didTapNextBtn), for: .touchUpInside)
        signUp3View.emailCertifyBtn.addTarget(self, action: #selector(didTapEmailCertifyBtn), for: .touchUpInside)
        signUp3View.certificationNumCertifyBtn.addTarget(
            self,
            action: #selector(didTapCertificationNumCertifyBtn),
            for: .touchUpInside)
    }
    
    @objc func didTapEmailCertifyBtn() {
        
    }

    @objc func didTapCertificationNumCertifyBtn() {
        
    }
    
    @objc func didTapNextBtn() {
        let signUp4VC = SignUp4ViewController()
        present(signUp4VC, animated: true, completion: nil)
    }

}
