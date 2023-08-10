//
//  SignUpViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/06.
//

import UIKit

final class SignUpProfileViewController: UIViewController {

    private let signUpProfileView = SignUpProfileView()
    
    override func loadView() {
        view = signUpProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTarget()
    }
    
    func addTarget() {
        signUpProfileView.signUpProfileNextPageButton.addTarget(self, action: #selector(didTapNextPageButton), for: .touchUpInside)
        signUpProfileView.signUpProfilePreviousPageButton.addTarget(self, action: #selector(didTappreviousPageButton), for: .touchUpInside)
        signUpProfileView.idCheckBtn.addTarget(self, action: #selector(didTapIdCheckBtn), for: .touchUpInside)
        signUpProfileView.maleBtn.addTarget(self, action: #selector(didTapMaleBtn), for: .touchUpInside)
        signUpProfileView.femaleBtn.addTarget(self, action: #selector(didTapFemaleBtn), for: .touchUpInside)
    }
    

    @objc func didTapNextPageButton() {
        let signUpLoverLinkingVC = SignUpLoverLinkingViewController()
        navigationController?.pushViewController(signUpLoverLinkingVC, animated: true)
    }
    
    @objc func didTappreviousPageButton() {
        navigationController?.popViewController(animated: true)
    }

    
    @objc func didTapIdCheckBtn() {
        
        
    }
    
    @objc func didTapMaleBtn() {
        print("남 선택")
        if signUpProfileView.maleBtn.isSelected == true {
            signUpProfileView.maleBtn.isSelected = false
         } else {
             signUpProfileView.maleBtn.isSelected = true
         }
    }
    
    @objc func didTapFemaleBtn() {
        if signUpProfileView.femaleBtn.isSelected == true {
            signUpProfileView.femaleBtn.isSelected = false
         } else {
             signUpProfileView.femaleBtn.isSelected = true
         }
    }
}
