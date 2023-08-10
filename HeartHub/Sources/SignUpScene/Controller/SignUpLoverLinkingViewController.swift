//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit
import DropDown

final class SignUpLoverLinkingViewController: UIViewController {

    private let signUpLoverLinkingView = SignUpLoverLinkingView()

    override func loadView() {
        view = signUpLoverLinkingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()

    }
    
    func addTarget() {
        signUpLoverLinkingView.signUpLoverNextPageButton.addTarget(self, action: #selector(didTapnextPageButton), for: .touchUpInside)
        signUpLoverLinkingView.signUpLoverPreviousPageButton.addTarget(self, action: #selector(didTappreviousPageButton), for: .touchUpInside)
        signUpLoverLinkingView.dropDownBtn.addTarget(self, action: #selector(didTapdropDownBtn), for: .touchUpInside)
    }
    
    @objc func didTapnextPageButton() {
        let signUpTermAgreeVC = SignUpTermAgreeViewController()
        navigationController?.pushViewController(signUpTermAgreeVC, animated: true)
    }
    
    @objc func didTappreviousPageButton() {
        navigationController?.popViewController(animated: true)
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
