//
//  ProfileDoneCancelViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/22.
//

import UIKit

class ProfileDoneCancelViewController: UIViewController {

    let profileDoneCancelBlockView = ProfileDoneEditUserStatusView(mainText: "차단 해제 되었습니다.")
    
    override func loadView() {
        view = profileDoneCancelBlockView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAddTarget()
    }
}

extension ProfileDoneCancelViewController {
    private func configureAddTarget() {
        profileDoneCancelBlockView.profileDoneCloseButton.addTarget(
            self,
            action: #selector(didTaProfileDoneBlockClosebutton),
            for: .touchUpInside
        )
    }

    @objc private func didTaProfileDoneBlockClosebutton() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
