//
//  PanModalTransitioningDelegate.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/23.
//

import UIKit

final class PanModalTransitioningDelegate: NSObject {
    static var shared = PanModalTransitioningDelegate()
    
    private override init() { }
}

extension PanModalTransitioningDelegate: UIViewControllerTransitioningDelegate {
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return PanModalAnimator(transitionStyle: .presentation)
    }
    
    func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        return PanModalPresentationController(
            presentedViewController: presented,
            presenting: presenting
        )
    }
    
    func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning?{
        return PanModalAnimator(transitionStyle: .dismissal)
    }
}
