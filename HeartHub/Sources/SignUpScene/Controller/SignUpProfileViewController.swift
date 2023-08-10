//
//  SignUpViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/06.
//

import UIKit

final class SignUpProfileViewController: UIViewController {

    private let signUpProfileView = SignUpProfileView()
    
    private var sexButtons: [UIButton] = []
    
    override func loadView() {
        view = signUpProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addTarget()
        configureSexButton()
    }
    
    private func addTarget() {
        signUpProfileView.signUpProfileNextPageButton.addTarget(self, action: #selector(didTapNextPageButton), for: .touchUpInside)
        signUpProfileView.signUpProfilePreviousPageButton.addTarget(self, action: #selector(didTappreviousPageButton), for: .touchUpInside)
        signUpProfileView.idCheckBtn.addTarget(self, action: #selector(didTapIdCheckBtn), for: .touchUpInside)
        signUpProfileView.maleBtn.addTarget(self, action: #selector(didTapMaleBtn), for: .touchUpInside)
        signUpProfileView.femaleBtn.addTarget(self, action: #selector(didTapMaleBtn), for: .touchUpInside)
    }
    
    private func configureSexButton() {
        sexButtons.append(signUpProfileView.maleBtn)
        sexButtons.append(signUpProfileView.femaleBtn)
        
        for (index, button) in sexButtons.enumerated() {
            button.addTarget(self, action: #selector(didTapSexButton), for: .touchUpInside)
            button.tag = index
        }
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
    
    @objc private func didTapSexButton(_ sender: UIButton) {
        self.sexButtons.forEach {
            if $0.tag == sender.tag {
                $0.isSelected = true
            } else {
                $0.isSelected = false
            }
        }
    }
    
    @objc func didTapMaleBtn() {
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
