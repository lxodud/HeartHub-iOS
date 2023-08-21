//
//  ProfileReportCancelViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/20.
//

import UIKit

final class ProfileBlockCancelViewController: UIViewController {

    private let cancelReportUserView = ProfileBlockCancelView()
    
    override func loadView() {
        view = cancelReportUserView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureAddTarget()
    }
    
    private func configureAddTarget() {
        cancelReportUserView.profileCancelReportCancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        cancelReportUserView.profileCancelReportVerifyButton.addTarget(self, action: #selector(didTapVerifyButton), for: .touchUpInside)
    }

    @objc private func didTapCancelButton() {
        dismiss(animated: true)
    }
    
    @objc private func didTapVerifyButton() {
        let profileDoneBlockViewController = ProfileDoneBlockViewController()
        modalPresentationStyle = .overFullScreen
        present(profileDoneBlockViewController, animated: true)
    }
}
