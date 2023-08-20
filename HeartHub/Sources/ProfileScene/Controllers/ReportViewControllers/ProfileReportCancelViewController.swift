//
//  ProfileReportCancelViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/20.
//

import UIKit

final class ProfileReportCancelViewController: UIViewController {

    private let cancelReportUserView = ProfileReportCancelView()
    
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
//        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
    }
}
