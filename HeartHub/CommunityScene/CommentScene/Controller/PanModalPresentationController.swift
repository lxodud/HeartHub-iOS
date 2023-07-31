//
//  PanModalPresentationViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/23.
//

import UIKit

final class PanModalPresentationController: UIPresentationController {
    private let screenHeight: CGFloat
    
    private lazy var halfModalYPosition: CGFloat = screenHeight / 2.5
    private lazy var fullModalYPosition: CGFloat = screenHeight / 11
    private lazy var stickyViewYPostion: CGFloat = screenHeight - 100
    
    private var gestureDirection: CGFloat = 0.0
    private var scrollViewYOffSet: CGFloat = 0.0
    private var scrollObserver: NSKeyValueObservation?
    private var beganAtCanRespond: Bool = false
    private var stickyViewBottomConstraint: NSLayoutConstraint?
    
    private var isPresentedViewFixed: Bool {
        let yPosition = presentedView!.frame.minY
        return yPosition <= halfModalYPosition + 10 || yPosition <= fullModalYPosition + 10
    }
    
    private let presentable: PanModalPresentable?
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
        screenHeight = UIScreen.current?.bounds.height ?? .zero
        presentable = presentedViewController as? PanModalPresentable
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
        configurePresentableStickyView(with: containerView)
        configureObserver()
        addKeyboardObserver()
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            return
        }
        
        coordinator.animate { [weak self] _ in
            
            self?.backgroundView.blurState = .max
            
            guard let stickyView = self?.presentable?.stickyView,
                  let stickyViewYPostion = self?.stickyViewYPostion
            else {
                return
            }
            
            stickyView.frame.origin.y = stickyViewYPostion
        }
    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            return
        }
        
        coordinator.animate(alongsideTransition: { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.backgroundView.blurState = .zero
            
            guard let stickyView = self.presentable?.stickyView,
                  let containerViewHeight = self.containerView?.frame.height
            else {
                return
            }
            
            stickyView.frame.origin.y = containerViewHeight
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

// MARK: Keyboard Notification
extension PanModalPresentationController {
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(willHideKeyboard),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc
    private func willShowKeyboard(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let presentable = presentable,
              let stickyView = presentable.stickyView,
              let presentedView = presentedView,
              presentable.isStickyViewFirstResponder
        else {
            return
        }
        
        stickyView.frame.origin.y -= keyboardFrame.cgRectValue.height + stickyView.frame.height
        self.stickyViewBottomConstraint?.constant = -(keyboardFrame.cgRectValue.height)
        presentedView.frame.size.height = screenHeight - fullModalYPosition
        presentedView.frame.origin.y = fullModalYPosition
    }
    
    @objc
    private func willHideKeyboard() {
        guard let stickyView = presentable?.stickyView else {
            return
        }
        
        stickyView.frame.origin.y = stickyViewYPostion
        self.stickyViewBottomConstraint?.constant = 0
    }
}

// MARK: Observe Scroll
extension PanModalPresentationController {
    private func configureObserver() {
        scrollObserver = presentable?
            .scrollView?.observe(\.contentOffset, changeHandler: { scrollView, value in
                self.panScrollView(
                    scrollView,
                    change: value
                )
            })
    }
    
    private func panScrollView(
        _ scrollView: UIScrollView,
        change: NSKeyValueObservedChange<CGPoint>
    ) {        
        if isPresentedViewFixed == false && scrollView.contentOffset.y > 0 {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollViewYOffSet), animated: false)
            scrollView.showsVerticalScrollIndicator = false
        } else if isPresentedViewFixed && scrollView.contentOffset.y <= 0 {
            
        } else {
            scrollViewYOffSet = max(scrollView.contentOffset.y, 0)
            scrollView.showsVerticalScrollIndicator = true
        }
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
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        
        panGesture.delegate = self
        
        backgroundView.addGestureRecognizer(tapGesture)
        presentedView?.addGestureRecognizer(panGesture)
    }
    
    @objc
    private func tapBackgroundView() {
        presentable?.resignStickyViewFirstResponder()
        presentedViewController.dismiss(animated: true)
    }
    
    @objc
    private func panPresentedView(
        _ recognizer: UIPanGestureRecognizer
    ) {
        presentable?.resignStickyViewFirstResponder()
        guard let containerView = containerView,
              let presentedView = presentedView,
              let canRespond = presentable?.canRespond(to: recognizer)
        else {
            return
        }
        
        let dragPosition = recognizer.translation(in: presentedView)
        
        switch recognizer.state {
        case .began:
            if (presentedView.frame.minY <= halfModalYPosition + 10 && !canRespond) {
                return
            }
            
            beganAtCanRespond = true
        case .changed:
            if beganAtCanRespond == false {
                return
            }

            // 최대 높이에서 더 이상 올라가지 못하게 구현
            let changedPosition = presentedView.frame.origin.y + dragPosition.y
            presentedView.frame.origin.y = max(changedPosition, fullModalYPosition)
           
            recognizer.setTranslation(.zero, in: containerView)
            gestureDirection = recognizer.velocity(in: containerView).y
            
            // change blur view alpha with current y position
            let y = presentedView.frame.origin.y - halfModalYPosition
            backgroundView.blurState = .calculatedValue(1.0 - (y / presentedView.frame.height))
            
            // stickyView의 Yposition 조정
            if let stickyView = presentable?.stickyView {
                if presentedView.frame.minY > halfModalYPosition {
                    let changedPosition = stickyView.frame.minY + dragPosition.y
                    let adjustPosition = min(changedPosition, containerView.frame.height)
                    stickyView.frame.origin.y = max(adjustPosition, stickyViewYPostion)
                } else {
                    stickyView.frame.origin.y = stickyViewYPostion
                    let changedHeight = presentedView.frame.size.height - dragPosition.y
                    presentedView.frame.size.height = changedHeight
                }
            }
        case .ended, .cancelled:
            adjustYPosition(with: presentedView.frame.minY ,to: gestureDirection)
            adjustPresentedViewHeight(with: presentedView.frame.minY, to: gestureDirection)
            adjustStickyView(with: presentedView.frame.minY)
            beganAtCanRespond = false
        default:
            break
        }
    }
    
    private func adjustStickyView(with changedYPosition: CGFloat) {
        guard let stickyView = presentable?.stickyView else {
            return
        }
        
        if changedYPosition > halfModalYPosition + 100 {
            stickyView.removeFromSuperview()
        }
    }
    
    private func adjustPresentedViewHeight(
        with changedYPosition: CGFloat,
        to direction: CGFloat
    ) {
        guard let presentedView = presentedView else {
            return
        }
        
        var changedHeight = screenHeight
        
        if changedYPosition < halfModalYPosition {
            if direction < 0 {
                changedHeight -= fullModalYPosition
            } else {
                changedHeight -= halfModalYPosition
            }
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.5,
            animations: {
                presentedView.frame.size.height = changedHeight
            })
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
        
        if changedYPosition > halfModalYPosition + 1 {
            resultYPosition = containerView.frame.height
            presentedViewController.dismiss(animated: true)
        } else if changedYPosition < halfModalYPosition + 1 {
            if direction < 0 {
                resultYPosition = fullModalYPosition
            } else {
                resultYPosition = halfModalYPosition
            }
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.5,
            animations: {
                presentedView.frame.origin.y = resultYPosition
            })
    }
}

// MARK: Configure UI
extension PanModalPresentationController {
    private func configurePresentableStickyView(with containerView: UIView) {
        guard let stickyView = presentable?.stickyView else {
            return
        }
        
        containerView.addSubview(stickyView)
        stickyView.translatesAutoresizingMaskIntoConstraints = false
        
        stickyView.frame.origin.y = containerView.frame.height
        
        let bottomConstraint = stickyView.bottomAnchor.constraint(
            equalTo: containerView.bottomAnchor
        )
        stickyViewBottomConstraint = bottomConstraint
        
        NSLayoutConstraint.activate([
            stickyView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor
            ),
            stickyView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor
            ),
            stickyView.heightAnchor.constraint(
                equalToConstant: 100
            ),
            bottomConstraint
        ])
    }
    
    private func configurePresentedViewInitialSetting(with containerView: UIView) {
        guard let presentedView = presentedView else {
            return
        }
        
        presentedView.layer.cornerRadius = 40
        presentedView.clipsToBounds = true
        
        presentedView.frame.size.height = (stickyViewYPostion - halfModalYPosition) + 100
        
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
                constant: 15
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
