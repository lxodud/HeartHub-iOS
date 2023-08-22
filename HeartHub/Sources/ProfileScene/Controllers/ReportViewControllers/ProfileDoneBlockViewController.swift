//
//  ProfileDoneBlockViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/20.
//

import UIKit

final class ProfileDoneBlockViewController: UIViewController {

    let profileDoneBlockView = ProfileDoneEditUserStatusView(mainText: "정상적으로 차단되었습니다.")
    
    override func loadView() {
        view = profileDoneBlockView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddTarget()
    }
}

extension ProfileDoneBlockViewController {
    private func configureAddTarget() {
        profileDoneBlockView.profileDoneCloseButton.addTarget(
            self,
            action: #selector(didTaProfileDoneBlockClosebutton),
            for: .touchUpInside
        )
    }

    @objc private func didTaProfileDoneBlockClosebutton() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
