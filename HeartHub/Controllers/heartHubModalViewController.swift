//
//  heartHubModalViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/16.
//

import UIKit

class heartHubModalViewController: UIViewController {
    
    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width

    private let heartHubModalView = HeartHubModalView()
    
    override func loadView() {
        view = heartHubModalView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupAddTarget()
        self.preferredContentSize = CGSize(width: 330 / screenHeight, height: 450 / screenHeight)
    }
    
    func setupAddTarget() {
        heartHubModalView.closeBtn.addTarget(self, action: #selector(didTapCloseBtn), for: .touchUpInside)
    }

    @objc private func didTapCloseBtn() {
        dismiss(animated: true)
    }
    

}
