//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit
import DropDown

class SignUp3ViewController: UIViewController {

    private let signUp3View = SignUp3View()

    override func loadView() {
        view = signUp3View
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()

    }
    
    func addTarget() {
        signUp3View.rightArrowBtn.addTarget(self, action: #selector(didTapRightArrowBtn), for: .touchUpInside)
        signUp3View.leftArrowBtn.addTarget(self, action: #selector(didTapLeftArrowBtn), for: .touchUpInside)
        signUp3View.dropDownBtn.addTarget(self, action: #selector(didTapdropDownBtn), for: .touchUpInside)
    }
    
    @objc func didTapRightArrowBtn() {
        let signUp4VC = SignUp4ViewController()
        signUp4VC.modalPresentationStyle = .fullScreen
        present(signUp4VC, animated: true, completion: nil)
    }
    
    @objc func didTapLeftArrowBtn() {
        let signUp2VC = SignUp2ViewController()
        signUp2VC.modalPresentationStyle = .fullScreen
        present(signUp2VC, animated: true, completion: nil)
    }

    
    @objc func didTapdropDownBtn() {        
        if signUp3View.dropDownBtn.currentImage == UIImage(named: "DropDownArrow.png") {
            let upArrow = UIImage(named: "DropUpArrow.png")
            signUp3View.dropDownBtn.setImage(upArrow, for: .normal)
            signUp3View.emailDropDown.show()
        } else {
            let downArrow = UIImage(named: "DropDownArrow.png")
            signUp3View.dropDownBtn.setImage(downArrow, for: .normal)
            signUp3View.emailDropDown.hide()
        }
    }
}
