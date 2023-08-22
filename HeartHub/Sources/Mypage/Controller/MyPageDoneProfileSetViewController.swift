//
//  MyPageDoneProfileSetViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/22.
//

import UIKit

class MyPageDoneProfileSetViewController: UIViewController {

    private let myPageDoneProfileSetView = MyPageDoneProfileSetView()
    
    override func loadView() {
        view = myPageDoneProfileSetView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureAddTarget()
    }
    
    private func configureAddTarget() {
        myPageDoneProfileSetView.doneProfileUpdateButton.addTarget(self, action: #selector(didTapDoneProfileUpdateButton), for: .touchUpInside)
    }

    @objc private func didTapDoneProfileUpdateButton() {
        dismiss(animated: true)
    }
}
