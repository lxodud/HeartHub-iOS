//
//  FindIdViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/16.
//

import UIKit

class FindIdViewController: UIViewController {

    private let findIdView = FindIdView()
    
    override func loadView() {
        view = findIdView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
        
    }
    
    func setupAddTarget() {
        findIdView.findIdBtn.addTarget(self, action: #selector(didTapFindIdButton), for: .touchUpInside)
        findIdView.signUpBtn.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        findIdView.findPwBtn.addTarget(self, action: #selector(didTapFindPwButton), for: .touchUpInside)
    }

    @objc private func didTapFindIdButton() {
        let heartHubModalVC = heartHubModalViewController()
        heartHubModalVC.modalPresentationStyle = .formSheet
        present(heartHubModalVC, animated: true, completion: nil)
    }
    
    @objc private func didTapSignUpButton() {
        let signUpVC = SignUpViewController()
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc private func didTapFindPwButton() {
        // let findPwVC = FindPwViewController()
        // present(findPwVC, animated: true, completion: nil)
    }
    

}
