//
//  PanModalPresentationViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/23.
//

import UIKit

final class PanModalPresentationController: UIPresentationController {
    private let halfModalYPosition: CGFloat = 500
    private let fullModalYPosition: CGFloat = 50
    private var gestureDirection: CGFloat = 0.0
    
    private let backgroundView = BlurView()
    private let dragIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5.0 / 2
        return view
    }()
    
    override init(
        presentedViewController: UIViewController,
        presenting presentingViewController: UIViewController?
    ) {
        super.init(
            presentedViewController: presentedViewController,
            presenting: presentingViewController
        )
        configureAction()
    }
}

// MARK: Life Cycle
extension PanModalPresentationController{
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else {
            return
        }
        
        configureBackgroundViewInitialSetting(with: containerView)
        configureBackgroundViewLayout(with: containerView)
        configurePresentedViewInitialSetting(with: containerView)
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            return
        }
        
        coordinator.animate { [weak self] _ in
            self?.backgroundView.blurState = .max
        }
    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            return
        }
        
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.backgroundView.blurState = .zero
        })
    }
}

// MARK: UIGestureRecognizerDelegate Implementation
extension PanModalPresentationController: UIGestureRecognizerDelegate {
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        return true
    }
}

// MARK: Configure Action
extension PanModalPresentationController {
    private func configureAction() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(tapBackgroundView)
        )
        
        let panGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(panPresentedView)
        )
        
        panGesture.delegate = self
        
        backgroundView.addGestureRecognizer(tapGesture)
        presentedView?.addGestureRecognizer(panGesture)
    }
    
    @objc
    private func tapBackgroundView() {
        presentedViewController.dismiss(animated: true)
    }
    
    @objc
    private func panPresentedView(
        _ recognizer: UIPanGestureRecognizer
    ) {
        guard let containerView = containerView,
              let presentedView = presentedView
        else {
            return
        }
        
        let dragPosition = recognizer.translation(in: presentedView)
        
        switch recognizer.state {
        case .changed:
            
            // 최대 높이에서 더 이상 올라가지 못하게 구현
            let changedPosition = presentedView.frame.origin.y + dragPosition.y
            presentedView.frame.origin.y = max(changedPosition, fullModalYPosition)
            
            recognizer.setTranslation(.zero, in: containerView)
            gestureDirection = recognizer.velocity(in: containerView).y
            
            
            // change blur view alpha with current y position
            let y = presentedView.frame.origin.y - halfModalYPosition
            backgroundView.blurState = .calculatedValue(1.0 - (y / presentedView.frame.height))
            
        case .ended, .cancelled:
            adjustYPosition(with: presentedView.frame.minY ,to: gestureDirection)
        default:
            break
        }
    }
    
    private func adjustYPosition(
        with changedYPosition: CGFloat,
        to direction: CGFloat
    ) {
        guard let containerView = containerView,
              let presentedView = presentedView
        else {
            return
        }
        var resultYPosition: CGFloat = 0.0
        
        if changedYPosition > halfModalYPosition {
            resultYPosition = containerView.frame.height
            presentedViewController.dismiss(animated: true)
        } else if changedYPosition < halfModalYPosition {
            if direction < 0 {
                resultYPosition = fullModalYPosition
            } else {
                resultYPosition = halfModalYPosition
            }
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            animations: {
                presentedView.frame.origin.y = resultYPosition
            })
    }
}

// MARK: Configure UI
extension PanModalPresentationController {
    private func configurePresentedViewInitialSetting(with containerView: UIView) {
        guard let presentedView = presentedView else {
            return
        }
        presentedView.layer.cornerRadius = 40
        
        containerView.addSubview(presentedView)
        presentedView.addSubview(dragIndicator)
        configureDragIndicatorLayout(with: presentedView)
    }
    
    private func configureDragIndicatorLayout(with presentedView: UIView) {
        dragIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dragIndicator.widthAnchor.constraint(
                equalToConstant: 36.0
            ),
            dragIndicator.heightAnchor.constraint(
                equalToConstant: 5.0
            ),
            dragIndicator.centerXAnchor.constraint(
                equalTo: presentedView.centerXAnchor
            ),
            
            dragIndicator.bottomAnchor.constraint(
                equalTo: presentedView.topAnchor,
                constant: 8
            )
        ])
    }
    
    private func configureBackgroundViewInitialSetting(with containerView: UIView) {
        containerView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureBackgroundViewLayout(with containerView: UIView) {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(
                equalTo: containerView.topAnchor
            ),
            backgroundView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor
            ),
            backgroundView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor
            ),
            backgroundView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor
            ),
        ])
    }
}
