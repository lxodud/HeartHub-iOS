//
//  ProfileReportUserViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/20.
//

import UIKit

final class ProfileBlockUserViewController: UIViewController {
    
    private let reportUserView = ProfileBlockUserView()
    
    override func loadView() {
        view = reportUserView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureAddTarget()
    }
}

extension ProfileBlockUserViewController {
    private func configureAddTarget() {
        reportUserView.profileReportCancelButton.addTarget(self, action: #selector(didTapReportCancelButton), for: .touchUpInside)
        reportUserView.profileReportBlockButton.addTarget(self, action: #selector(didTapReportBlockButton), for: .touchUpInside)
    }

    @objc func didTapReportCancelButton() {
        dismiss(animated: true)
    }
    
    @objc private func didTapReportBlockButton() {
        let profileDoneBlockViewController = ProfileDoneBlockViewController()
        modalPresentationStyle = .overFullScreen
        present(profileDoneBlockViewController, animated: true)
    }
}
