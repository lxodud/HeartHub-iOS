//
//  SignUpViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/06.
//

import UIKit

class SignUpProfileViewController: UIViewController {

    private let signUpProfileView = SignUpProfileView()
    
    override func loadView() {
        view = signUpProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTarget()
    }
    
    func addTarget() {
        signUpProfileView.rightArrowBtn.addTarget(self, action: #selector(didTapRightArrowBtn), for: .touchUpInside)
        signUpProfileView.leftArrowBtn.addTarget(self, action: #selector(didTapLeftArrowBtn), for: .touchUpInside)
        signUpProfileView.nickNameCheckBtn.addTarget(self, action: #selector(didTapNickNameCheckBtn), for: .touchUpInside)
        signUpProfileView.idCheckBtn.addTarget(self, action: #selector(didTapIdCheckBtn), for: .touchUpInside)
        signUpProfileView.maleBtn.addTarget(self, action: #selector(didTapMaleBtn), for: .touchUpInside)
        signUpProfileView.femaleBtn.addTarget(self, action: #selector(didTapFemaleBtn), for: .touchUpInside)
    }
    

    @objc func didTapRightArrowBtn() {
        let signUpLoverLinkingVC = SignUpLoverLinkingViewController()
        navigationController?.pushViewController(signUpLoverLinkingVC, animated: true)
    }
    
    @objc func didTapLeftArrowBtn() {
        let signUpStartDateVC = SignUpStartDateViewController()
        navigationController?.pushViewController(signUpStartDateVC, animated: true)
    }

    @objc func didTapNickNameCheckBtn() {
        
        
    }
    
    @objc func didTapIdCheckBtn() {
        
        
    }
    
    @objc func didTapMaleBtn() {
        print("남 선택")
        
        //버튼의 이미지가 "RadioBtnChecked" ->  "RadioBtnUnchecked"로 바꾸고 else "RadioBtnUnchecked" -> "RadioBtnChecked" 로 바꿈
        signUpProfileView.femaleBtn.setImage(UIImage(named: "RadioBtnUnChecked"), for: .normal)
        if signUpProfileView.maleBtn.currentImage == UIImage(named: "RadioBtnChecked") {
           let unChekedimage = UIImage(named: "RadioBtnUnChecked")
            signUpProfileView.maleBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "RadioBtnChecked")
            signUpProfileView.maleBtn.setImage(Chekedimage, for: .normal)
        }
    }
    
    @objc func didTapFemaleBtn() {
        print("남 선택")
        
        //버튼의 이미지가 "RadioBtnChecked" ->  "RadioBtnUnchecked"로 바꾸고 else "RadioBtnUnchecked" -> "RadioBtnChecked" 로 바꿈
        signUpProfileView.maleBtn.setImage(UIImage(named: "RadioBtnUnChecked"), for: .normal)
        if signUpProfileView.femaleBtn.currentImage == UIImage(named: "RadioBtnChecked") {
           let unChekedimage = UIImage(named: "RadioBtnUnChecked")
            signUpProfileView.femaleBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "RadioBtnChecked")
            signUpProfileView.femaleBtn.setImage(Chekedimage, for: .normal)
        }
    }
}
