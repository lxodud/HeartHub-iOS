//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit

class SignUpTermAgreeViewController: UIViewController {

    private let signUpTermAgreeView = SignUpTermAgreeView()

    let unCheckedImage = UIImage(named: "AgreeRadioBtnUnChecked")
    let checkedImage = UIImage(named: "AgreeRadioBtnChecked")
    
    var allTermAgree = false
    
    override func loadView() {
        view = signUpTermAgreeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    
    func addTarget() {
        signUpTermAgreeView.rightArrowBtn.addTarget(self, action: #selector(didTapRightArrowBtn), for: .touchUpInside)
        signUpTermAgreeView.leftArrowBtn.addTarget(self, action: #selector(didTapLeftArrowBtn), for: .touchUpInside)
        signUpTermAgreeView.allTermAgreeBtn.addTarget(self, action: #selector(didTapAllAgreeBtn), for: .touchUpInside)
        signUpTermAgreeView.privacyAgreeBtn.addTarget(self, action: #selector(didTapPrivacyAgreeBtn), for: .touchUpInside)
        signUpTermAgreeView.termOfUseAgreeBtn.addTarget(self, action: #selector(didTapTermOfUseAgreeBtn), for: .touchUpInside)
        signUpTermAgreeView.marketingAgreeBtn.addTarget(self, action: #selector(didTapMarketingAgreeBtn), for: .touchUpInside)

        signUpTermAgreeView.privacyDescriptionBtn.addTarget(self, action: #selector(didTapPrivacyArrowBtn), for: .touchUpInside)
        signUpTermAgreeView.termOfUseDescriptionBtn.addTarget(self, action: #selector(didTapTermOfUseArrowBtn), for: .touchUpInside)
        signUpTermAgreeView.marketingDescriptionBtn.addTarget(self, action: #selector(didTapmarketingDescriptionBtn), for: .touchUpInside)

    }
    
    @objc func didTapRightArrowBtn() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func didTapLeftArrowBtn() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapAllAgreeBtn() {
        if signUpTermAgreeView.allTermAgreeBtn.currentImage == checkedImage {
            signUpTermAgreeView.allTermAgreeBtn.setImage(unCheckedImage, for: .normal)
            signUpTermAgreeView.privacyAgreeBtn.setImage(unCheckedImage, for: .normal)
            signUpTermAgreeView.termOfUseAgreeBtn.setImage(unCheckedImage, for: .normal)
            signUpTermAgreeView.marketingAgreeBtn.setImage(unCheckedImage, for: .normal)
        } else {
            signUpTermAgreeView.allTermAgreeBtn.setImage(checkedImage, for: .normal)
            if signUpTermAgreeView.privacyAgreeBtn.currentImage == checkedImage
                || signUpTermAgreeView.termOfUseAgreeBtn == checkedImage
                || signUpTermAgreeView.marketingAgreeBtn == checkedImage {
                signUpTermAgreeView.privacyAgreeBtn.setImage(checkedImage, for: .normal)
                signUpTermAgreeView.termOfUseAgreeBtn.setImage(checkedImage, for: .normal)
                signUpTermAgreeView.marketingAgreeBtn.setImage(checkedImage, for: .normal)
            } else if signUpTermAgreeView.privacyAgreeBtn.currentImage == unCheckedImage
                        || signUpTermAgreeView.termOfUseAgreeBtn == unCheckedImage
                        || signUpTermAgreeView.marketingAgreeBtn == unCheckedImage {
                signUpTermAgreeView.privacyAgreeBtn.setImage(checkedImage, for: .normal)
                signUpTermAgreeView.termOfUseAgreeBtn.setImage(checkedImage, for: .normal)
                signUpTermAgreeView.marketingAgreeBtn.setImage(checkedImage, for: .normal)
            } else {
                signUpTermAgreeView.privacyAgreeBtn.setImage(unCheckedImage, for: .normal)
                signUpTermAgreeView.termOfUseAgreeBtn.setImage(unCheckedImage, for: .normal)
                signUpTermAgreeView.marketingAgreeBtn.setImage(unCheckedImage, for: .normal)
            }
        }
    }
    
    @objc func didTapPrivacyAgreeBtn() {
        if signUpTermAgreeView.privacyAgreeBtn.currentImage == checkedImage {
            signUpTermAgreeView.privacyAgreeBtn.setImage(unCheckedImage, for: .normal)
        } else {
            signUpTermAgreeView.privacyAgreeBtn.setImage(checkedImage, for: .normal)
        }
        checkAllTermAgree()
    }
    
    @objc func didTapTermOfUseAgreeBtn() {
        if signUpTermAgreeView.termOfUseAgreeBtn.currentImage == checkedImage {
            signUpTermAgreeView.termOfUseAgreeBtn.setImage(unCheckedImage, for: .normal)
        } else {
            signUpTermAgreeView.termOfUseAgreeBtn.setImage(checkedImage, for: .normal)
        }
        checkAllTermAgree()
    }
    
    @objc func didTapMarketingAgreeBtn() {
        if signUpTermAgreeView.marketingAgreeBtn.currentImage == checkedImage {
            signUpTermAgreeView.marketingAgreeBtn.setImage(unCheckedImage, for: .normal)
        } else {
            signUpTermAgreeView.marketingAgreeBtn.setImage(checkedImage, for: .normal)
        }
        checkAllTermAgree()
    }
    
    private func checkAllTermAgree() {
        if signUpTermAgreeView.privacyAgreeBtn.currentImage == unCheckedImage
            || signUpTermAgreeView.termOfUseAgreeBtn.currentImage == unCheckedImage
            || signUpTermAgreeView.marketingAgreeBtn.currentImage == unCheckedImage {
            signUpTermAgreeView.allTermAgreeBtn.setImage(unCheckedImage, for: .normal)
        } else if signUpTermAgreeView.privacyAgreeBtn.currentImage == checkedImage
        && signUpTermAgreeView.termOfUseAgreeBtn.currentImage == checkedImage
        && signUpTermAgreeView.marketingAgreeBtn.currentImage == checkedImage {
        signUpTermAgreeView.allTermAgreeBtn.setImage(checkedImage, for: .normal)
    }
        
    }
        
    @objc func didTapPrivacyArrowBtn() {
        
        
    }
    
    @objc func didTapTermOfUseArrowBtn() {
        
        
    }
    
    @objc func didTapmarketingDescriptionBtn() {
        
    }
}

