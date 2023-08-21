//
//  CommunityPageViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/08.
//

import UIKit

final class CommunityViewController: UIViewController {
    private let communityPageViewController: UIViewController? = {
        let pageViewController = HeartHubPageViewController(
            viewControllers: [
                DailyDateViewController(articleDataSource: CommunityArticleDataSource(theme: .daily)),
                LookViewController(articleDataSource: CommunityArticleDataSource(theme: .look)),
                DailyDateViewController(articleDataSource: CommunityArticleDataSource(theme: .date))
            ]
        )
        return pageViewController
    }()
    
    private let writeArticleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "WriteArticleButton"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommunityPageViewInitialSetting()
        configureCommunityPageViewLayout()
        configureWriteArticleButtonInitialSetting()
        configureWriteArticleButtonLayout()
        configureWriteArticelButtonAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}

// MARK: Configure CommunityPageViewController
extension CommunityViewController {
    private func configureCommunityPageViewInitialSetting() {
        guard let communityPageView = communityPageViewController?.view else {
            return
        }
        view.addSubview(communityPageView)
        communityPageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCommunityPageViewLayout() {
        guard let communityPageView = communityPageViewController?.view else {
            return
        }
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            communityPageView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            communityPageView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            communityPageView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            communityPageView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            ),
        ])
    }
}

// MARK: Configure FloatingButton
extension CommunityViewController {
    private func configureWriteArticleButtonInitialSetting() {
        view.addSubview(writeArticleButton)
        writeArticleButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureWriteArticleButtonLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            writeArticleButton.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor,
                constant: -10
            ),
            writeArticleButton.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -10
            )
        ])
    }
    
    private func configureWriteArticelButtonAction() {
        writeArticleButton.addTarget(self, action: #selector(tapWriteArticleButton), for: .touchUpInside)
    }
    
    @objc
    private func tapWriteArticleButton() {
        let addPostViewController = AddPostViewController()
        navigationController?.show(addPostViewController, sender: nil)
    }
}
