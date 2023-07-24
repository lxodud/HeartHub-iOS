//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit

class SignUpTermAgreeViewController: UIViewController {

    private let signUpTermAgreeView = SignUpTermAgreeView()

    let unChekedimage = UIImage(named: "AgreeRadioBtnUnChecked")
    let Chekedimage = UIImage(named: "AgreeRadioBtnChecked")
    
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
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func didTapLeftArrowBtn() {
        let signUpLoverLinkingVC = SignUpLoverLinkingViewController()
        navigationController?.pushViewController(signUpLoverLinkingVC, animated: true)
    }
    
    @objc func didTapAllAgreeBtn() {
        if signUpTermAgreeView.allTermAgreeBtn.currentImage == UIImage(named: "AgreeRadioBtnChecked") {
            signUpTermAgreeView.allTermAgreeBtn.setImage(unChekedimage, for: .normal)
            signUpTermAgreeView.privacyAgreeBtn.setImage(unChekedimage, for: .normal)
            signUpTermAgreeView.termOfUseAgreeBtn.setImage(unChekedimage, for: .normal)
            signUpTermAgreeView.marketingAgreeBtn.setImage(unChekedimage, for: .normal)
        } else {
            signUpTermAgreeView.allTermAgreeBtn.setImage(Chekedimage, for: .normal)
            if signUpTermAgreeView.privacyAgreeBtn.currentImage == Chekedimage ||
                signUpTermAgreeView.termOfUseAgreeBtn == Chekedimage ||
                signUpTermAgreeView.marketingAgreeBtn == Chekedimage {
                signUpTermAgreeView.privacyAgreeBtn.setImage(Chekedimage, for: .normal)
                signUpTermAgreeView.termOfUseAgreeBtn.setImage(Chekedimage, for: .normal)
                signUpTermAgreeView.marketingAgreeBtn.setImage(Chekedimage, for: .normal)
            } else if signUpTermAgreeView.privacyAgreeBtn.currentImage == unChekedimage ||
                        signUpTermAgreeView.termOfUseAgreeBtn == unChekedimage ||
                        signUpTermAgreeView.marketingAgreeBtn == unChekedimage  {
                signUpTermAgreeView.privacyAgreeBtn.setImage(Chekedimage, for: .normal)
                signUpTermAgreeView.termOfUseAgreeBtn.setImage(Chekedimage, for: .normal)
                signUpTermAgreeView.marketingAgreeBtn.setImage(Chekedimage, for: .normal)
            } else{
                signUpTermAgreeView.privacyAgreeBtn.setImage(unChekedimage, for: .normal)
                signUpTermAgreeView.termOfUseAgreeBtn.setImage(unChekedimage, for: .normal)
                signUpTermAgreeView.marketingAgreeBtn.setImage(unChekedimage, for: .normal)
            }
        }
        

    }
    
    @objc func didTapPrivacyAgreeBtn() {
        if signUpTermAgreeView.privacyAgreeBtn.currentImage == UIImage(named: "AgreeRadioBtnChecked") {
            signUpTermAgreeView.privacyAgreeBtn.setImage(unChekedimage, for: .normal)
        } else {
            signUpTermAgreeView.privacyAgreeBtn.setImage(Chekedimage, for: .normal)
        }
    }
    
    @objc func didTapTermOfUseAgreeBtn() {
        if signUpTermAgreeView.termOfUseAgreeBtn.currentImage == UIImage(named: "AgreeRadioBtnChecked") {
            signUpTermAgreeView.termOfUseAgreeBtn.setImage(unChekedimage, for: .normal)
        } else {
            signUpTermAgreeView.termOfUseAgreeBtn.setImage(Chekedimage, for: .normal)
        }
    }
    
    @objc func didTapMarketingAgreeBtn() {
        if signUpTermAgreeView.marketingAgreeBtn.currentImage == UIImage(named: "AgreeRadioBtnChecked") {
            signUpTermAgreeView.marketingAgreeBtn.setImage(unChekedimage, for: .normal)
        } else {
            signUpTermAgreeView.marketingAgreeBtn.setImage(Chekedimage, for: .normal)
        }
    }
        
    @objc func didTapPrivacyArrowBtn() {
        
        
    }
    
    @objc func didTapTermOfUseArrowBtn() {
        
        
    }
    
    @objc func didTapmarketingDescriptionBtn() {
        
    }
}

