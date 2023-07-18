//
//  SignUpViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/06.
//

import UIKit

class SignUp2ViewController: UIViewController {

    private let signUp2View = SignUp2View()
    
    override func loadView() {
        view = signUp2View
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTarget()
    }
    
    func addTarget() {
        signUp2View.rightArrowBtn.addTarget(self, action: #selector(didTapRightArrowBtn), for: .touchUpInside)
        signUp2View.leftArrowBtn.addTarget(self, action: #selector(didTapLeftArrowBtn), for: .touchUpInside)
        signUp2View.nickNameCheckBtn.addTarget(self, action: #selector(didTapNickNameCheckBtn), for: .touchUpInside)
        signUp2View.idCheckBtn.addTarget(self, action: #selector(didTapIdCheckBtn), for: .touchUpInside)
        signUp2View.maleBtn.addTarget(self, action: #selector(didTapMaleBtn), for: .touchUpInside)
        signUp2View.femaleBtn.addTarget(self, action: #selector(didTapFemaleBtn), for: .touchUpInside)
    }
    

    @objc func didTapRightArrowBtn() {
        let signUp3VC = SignUp3ViewController()
        signUp3VC.modalPresentationStyle = .fullScreen
        present(signUp3VC, animated: true, completion: nil)
    }
    
    @objc func didTapLeftArrowBtn() {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }

    @objc func didTapNickNameCheckBtn() {
        
        
    }
    
    @objc func didTapIdCheckBtn() {
        
        
    }
    
    @objc func didTapMaleBtn() {
        print("남 선택")
        
        //버튼의 이미지가 "RadioBtnChecked" ->  "RadioBtnUnchecked"로 바꾸고 else "RadioBtnUnchecked" -> "RadioBtnChecked" 로 바꿈
        if signUp2View.maleBtn.currentImage == UIImage(named: "RadioBtnChecked") {
           let unChekedimage = UIImage(named: "RadioBtnUnChecked")
            signUp2View.maleBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "RadioBtnChecked")
            signUp2View.maleBtn.setImage(Chekedimage, for: .normal)
        }
    }
    
    @objc func didTapFemaleBtn() {
        print("남 선택")
        
        //버튼의 이미지가 "RadioBtnChecked" ->  "RadioBtnUnchecked"로 바꾸고 else "RadioBtnUnchecked" -> "RadioBtnChecked" 로 바꿈
        if signUp2View.femaleBtn.currentImage == UIImage(named: "RadioBtnChecked") {
           let unChekedimage = UIImage(named: "RadioBtnUnChecked")
            signUp2View.femaleBtn.setImage(unChekedimage, for: .normal)
        } else {
            let Chekedimage = UIImage(named: "RadioBtnChecked")
            signUp2View.femaleBtn.setImage(Chekedimage, for: .normal)
        }

    }
}
