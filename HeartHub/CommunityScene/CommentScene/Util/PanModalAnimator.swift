//
//  PanModalAnimator.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/23.
//

import UIKit

final class PanModalAnimator: NSObject {
    enum TransitionStyle {
        case presentation
        case dismissal
    }
    
    private let transitionStyle: TransitionStyle
    
    init(transitionStyle: TransitionStyle) {
        self.transitionStyle = transitionStyle
    }
}

// MARK: Transitioning Animate Implementation
extension PanModalAnimator {
    private func animatePresentation(
        transitionContext: UIViewControllerContextTransitioning
    ) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from)
        else {
            return
        }
        
        fromViewController.beginAppearanceTransition(false, animated: true)
        
        let yPosition = transitionContext.containerView.frame.height / 2
        
        guard let presentedView = fromViewController.presentedViewController?.view else {
            return
        }
        
        presentedView.frame = transitionContext.finalFrame(for: toViewController)
        presentedView.frame.origin.y = transitionContext.containerView.frame.height
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            animations: {
                presentedView.frame.origin.y = yPosition
            },
            completion: { complete in
                fromViewController.endAppearanceTransition()
                transitionContext.completeTransition(complete)
            })
    }
    
    private func animateDismissal(
        transitionContext: UIViewControllerContextTransitioning
    ) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let presentedView = toViewController.presentedViewController?.view
        else {
            return
        }
        
        toViewController.beginAppearanceTransition(false, animated: true)
        
        let yPosition = transitionContext.containerView.frame.height
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            animations: {
                presentedView.frame.origin.y = yPosition
            },
            completion: { complete in
                toViewController.endAppearanceTransition()
                transitionContext.completeTransition(complete)
            })
    }
}

// MARK: UIViewController Animated Transitioning Implementation
extension PanModalAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(
        using transitionContext: UIViewControllerContextTransitioning
    ) {
        switch transitionStyle {
        case .presentation:
            animatePresentation(transitionContext: transitionContext)
        case .dismissal:
            animateDismissal(transitionContext: transitionContext)
        }
    }
}
