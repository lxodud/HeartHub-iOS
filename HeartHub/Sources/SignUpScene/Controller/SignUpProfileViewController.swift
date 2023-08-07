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
        signUpProfileView.nextPageButton.addTarget(self, action: #selector(didTapNextPageButton), for: .touchUpInside)
        signUpProfileView.previousPageButton.addTarget(self, action: #selector(didTappreviousPageButton), for: .touchUpInside)
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
        
        //버튼의 이미지가 "RadioBtnChecked" ->  "RadioBtnUnchecked"로 바꾸고 else "RadioBtnUnchecked" -> "RadioBtnChecked" 로 바꿈
        signUpProfileView.femaleBtn.setImage(UIImage(named: "AgreeRadioBtnUnChecked"), for: .normal)
        if signUpProfileView.maleBtn.currentImage == UIImage(named: "AgreeRadioBtnChecked") {
           let unChekedimage = UIImage(named: "AgreeRadioBtnUnChecked")
            signUpProfileView.maleBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "AgreeRadioBtnChecked")
            signUpProfileView.maleBtn.setImage(Chekedimage, for: .normal)
        }
    }
    
    @objc func didTapFemaleBtn() {
        print("남 선택")
        
        //버튼의 이미지가 "RadioBtnChecked" ->  "RadioBtnUnchecked"로 바꾸고 else "RadioBtnUnchecked" -> "RadioBtnChecked" 로 바꿈
        signUpProfileView.maleBtn.setImage(UIImage(named: "AgreeRadioBtnUnChecked"), for: .normal)
        if signUpProfileView.femaleBtn.currentImage == UIImage(named: "AgreeRadioBtnChecked") {
           let unChekedimage = UIImage(named: "AgreeRadioBtnUnChecked")
            signUpProfileView.femaleBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "AgreeRadioBtnChecked")
            signUpProfileView.femaleBtn.setImage(Chekedimage, for: .normal)
        }
    }
}
