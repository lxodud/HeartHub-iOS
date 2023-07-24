//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit
import DropDown

class SignUpLoverLinkingViewController: UIViewController {

    private let signUpLoverLinkingView = SignUpLoverLinkingView()

    override func loadView() {
        view = signUpLoverLinkingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()

    }
    
    func addTarget() {
        signUpLoverLinkingView.rightArrowBtn.addTarget(self, action: #selector(didTapRightArrowBtn), for: .touchUpInside)
        signUpLoverLinkingView.leftArrowBtn.addTarget(self, action: #selector(didTapLeftArrowBtn), for: .touchUpInside)
        signUpLoverLinkingView.dropDownBtn.addTarget(self, action: #selector(didTapdropDownBtn), for: .touchUpInside)
    }
    
    @objc func didTapRightArrowBtn() {
        let signUp4VC = SignUpTermAgreeViewController()
        signUp4VC.modalPresentationStyle = .fullScreen
        present(signUp4VC, animated: true, completion: nil)
    }
    
    @objc func didTapLeftArrowBtn() {
        let signUp2VC = SignUpProfileViewController()
        signUp2VC.modalPresentationStyle = .fullScreen
        present(signUp2VC, animated: true, completion: nil)
    }

    
    @objc func didTapdropDownBtn() {        
        if signUpLoverLinkingView.dropDownBtn.currentImage == UIImage(named: "DropDownArrow.png") {
            let upArrow = UIImage(named: "DropUpArrow.png")
            signUpLoverLinkingView.dropDownBtn.setImage(upArrow, for: .normal)
            signUpLoverLinkingView.emailDropDown.show()
        } else {
            let downArrow = UIImage(named: "DropDownArrow.png")
            signUpLoverLinkingView.dropDownBtn.setImage(downArrow, for: .normal)
            signUpLoverLinkingView.emailDropDown.hide()
        }
    }
}
