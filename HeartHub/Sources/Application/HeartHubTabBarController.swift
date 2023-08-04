//
//  HeartHubTabBarController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/04.
//

import UIKit

final class HeartHubTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarItems()
    }
    
    private func configureTabBarInitialSetting() {
    }
    
    private func configureTabBarItems() {
        let communityViewController = UINavigationController(
            rootViewController: CommunityViewController()
        )
        communityViewController.tabBarItem.title = "커뮤니티"
        
        let coupleSpaceViewController = UINavigationController(
            rootViewController: CoupleSpaceMainViewController()
        )
        coupleSpaceViewController.tabBarItem.title = "커플공간"

        
        let myPageViewController = UINavigationController(
            rootViewController: UIViewController()
        )
        myPageViewController.tabBarItem.title = "마이페이지"
        
        setViewControllers(
            [communityViewController, coupleSpaceViewController, myPageViewController],
            animated: true
        )
    }
}
