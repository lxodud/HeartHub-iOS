//
//  CoupleSpacePickCollectionViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/03.
//

import UIKit

final class CoupleSpacePickCollectionViewController: UIViewController {
    private let pickCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        return collectionView
    }()
    
    private let pickTransitionButton: UIButton = {
        let button = UIButton()
        return button
    }()
}

// MARK: Life Cycle
extension CoupleSpacePickCollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: UICollectionView Delegate FlowLayout Implementation
extension CoupleSpacePickCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = view.frame.width / 2
        let height = width
        
        return CGSize(width: width, height: height)
    }
}

// MARK: Configure pickCollectionView
extension CoupleSpacePickCollectionViewController {
    private func configurePickCollectionView() {
        pickCollectionView.delegate = self
    }
}

// MARK: Configure UI
extension CoupleSpacePickCollectionViewController {
    private func configureSubview() {
        [pickCollectionView, pickTransitionButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: pickCollectionView Constraints
            pickCollectionView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            pickCollectionView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            pickCollectionView.trailingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            pickCollectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
            
            // MARK: pickTransitionButton Constraints
            pickTransitionButton.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -21
            ),
            pickTransitionButton.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor,
                constant: -21
            ),
        ])
    }
}
