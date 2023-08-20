//
//  ProfileReportUserViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/20.
//

import UIKit

class ProfileReportUserViewController: UIViewController {

    private let reportUserView = ProfileReportUserView()
    
    override func loadView() {
        view = reportUserView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureAddTarget()
    }
    
    private func configureAddTarget() {
        reportUserView.profileReportCancelButton.addTarget(self, action: #selector(didTapReportCancelButton), for: .touchUpInside)
        reportUserView.profileReportBlockButton.addTarget(self, action: #selector(didTapReportBlockButton), for: .touchUpInside)
    }

    @objc private func didTapReportCancelButton() {
        dismiss(animated: true)
    }
    
    @objc private func didTapReportBlockButton() {
//        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
}
