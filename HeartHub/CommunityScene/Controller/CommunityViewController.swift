//
//  CommunityPageViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/08.
//

import UIKit

final class CommunityViewController: UIViewController {
    private let communityPageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    )

    private let searchBar = UISearchBar()
    private let viewControllers: [UIViewController]
    
    init(viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewControllerInitialSetting()
        configurePageViewControllerLayout()
        configureSearchBar()
    }
}

// MARK: PageViewController DataSource
extension CommunityViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        
        return viewControllers[previousIndex]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == viewControllers.count {
            return nil
        }
        
        return viewControllers[nextIndex]
    }
}

// MARK: Configure PageViewController
extension CommunityViewController {
    private func configurePageViewControllerInitialSetting() {
        if let firstViewController = viewControllers.first {
            communityPageViewController.setViewControllers(
                [firstViewController],
                direction: .forward,
                animated: true
            )
        }
        
        communityPageViewController.dataSource = self
    }
    
    private func configurePageViewControllerLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        guard let pageView = communityPageViewController.view else {
            return
        }
        
        view.addSubview(pageView)
        
        NSLayoutConstraint.activate([
            pageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            pageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            pageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}

// MARK: Configure SearchBar
extension CommunityViewController {
    private func configureSearchBar() {
        searchBar.placeholder = "Search your interest!"
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.backgroundColor = .systemBackground
    }
}
