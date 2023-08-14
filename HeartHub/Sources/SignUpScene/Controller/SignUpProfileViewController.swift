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
        
        configureAddTarget()
        configureSexButton()
    }
}

// MARK: Configure AddTarget
extension SignUpProfileViewController {
    private func configureAddTarget() {
        signUpProfileView.signUpProfileNextPageButton.addTarget(self, action: #selector(didTapNextPageButton), for: .touchUpInside)
        signUpProfileView.signUpProfilePreviousPageButton.addTarget(self, action: #selector(didTappreviousPageButton), for: .touchUpInside)
        signUpProfileView.idCheckBtn.addTarget(self, action: #selector(didTapIdCheckBtn), for: .touchUpInside)
        signUpProfileView.maleBtn.addTarget(self, action: #selector(didTapMaleBtn), for: .touchUpInside)
        signUpProfileView.femaleBtn.addTarget(self, action: #selector(didTapMaleBtn), for: .touchUpInside)
        signUpProfileView.birthdayDatePicker.addTarget(self, action: #selector(didChangedBirthDayDate), for: .valueChanged)
    }
    
    private func configureSexButton() {
        sexButtons.append(signUpProfileView.maleBtn)
        sexButtons.append(signUpProfileView.femaleBtn)
        
        for (index, button) in sexButtons.enumerated() {
            button.addTarget(self, action: #selector(didTapSexButton), for: .touchUpInside)
            button.tag = index
        }
    }

    @objc private func didTapNextPageButton() {
        let signUpLoverLinkingVC = SignUpEnterNickNameEmailViewController()
        navigationController?.pushViewController(signUpLoverLinkingVC, animated: true)
    }
    
    @objc private func didTappreviousPageButton() {
        navigationController?.popViewController(animated: true)
    }

    
    @objc private func didTapIdCheckBtn() {
        
        
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
    
    @objc private func didTapMaleBtn() {
        if signUpProfileView.maleBtn.isSelected == true {
            signUpProfileView.maleBtn.isSelected = false
         } else {
             signUpProfileView.maleBtn.isSelected = true
         }
    }
    
    @objc private func didTapFemaleBtn() {
        if signUpProfileView.femaleBtn.isSelected == true {
            signUpProfileView.femaleBtn.isSelected = false
         } else {
             signUpProfileView.femaleBtn.isSelected = true
         }
    }
    
    @objc private func didChangedBirthDayDate(_ sender: UIDatePicker) {
        signUpProfileView.birthdayDateTextField.text = dateFormat(date: sender.date)
    }
}

extension SignUpProfileViewController {
    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        
        return formatter.string(from: date)
    }
}
