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
            viewControllers: [DailyDateViewController(), LookViewController()]
        )
        return pageViewController
    }()
    private let communityFloatingButton = CommunityFloatingButton()
    private let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommunityPageViewInitialSetting()
        configureCommunityPageViewLayout()
        configureFloatingButtonInitialSetting()
        configureFloatingButtonLayout()
        configureSearchBarInitialSetting()
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

// MARK: Configure SearchBar
extension CommunityViewController {
    private func configureSearchBarInitialSetting() {
        searchBar.placeholder = "Search your interest!"
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.backgroundColor = .systemBackground
    }
}

// MARK: Configure FloatingButton
extension CommunityViewController {
    private func configureFloatingButtonInitialSetting() {
        view.addSubview(communityFloatingButton)
        communityFloatingButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureFloatingButtonLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            communityFloatingButton.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor,
                constant: -10
            ),
            communityFloatingButton.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -10
            )
        ])
    }
}
