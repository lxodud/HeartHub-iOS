//
//  LookViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/20.
//

import UIKit

final class LookViewController: UIViewController {
    private let lookCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLookCollectionView()
        configureSubview()
        configureLayout()
    }
}

// MARK: UICollectionView Delegate FlowLayout Implementation
extension LookViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
}

// MARK: UICollectionView DataSource Implementation
extension LookViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

// MARK: Configure CollectionView
extension LookViewController {
    private func configureLookCollectionView()  {
        lookCollectionView.dataSource = self
        lookCollectionView.delegate = self
    }
}

// MARK: Configure UI
extension LookViewController {
    private func configureSubview() {
        view.addSubview(lookCollectionView)
        lookCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            lookCollectionView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            lookCollectionView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            lookCollectionView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            lookCollectionView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            ),
        ])
    }
}
