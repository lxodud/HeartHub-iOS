//
//  DailyViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/06.
//

import UIKit

final class DailyDateViewController: UIViewController {
    private lazy var dailyCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDailyCollectionView()
        configureSubview()
        configureLayout()
    }
}

extension DailyDateViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 10
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

// MARK: Configure CollectionView
extension DailyDateViewController {
    private func configureDailyCollectionView()  {
        dailyCollectionView.dataSource = self
    }
    
    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let feedItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.7)
        )
        let feedGroup = NSCollectionLayoutGroup
            .vertical(
                layoutSize: groupSize,
                subitem: feedItem,
                count: 1
            )
        
        let section = NSCollectionLayoutSection(group: feedGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: Configure UI
extension DailyDateViewController {
    private func configureSubview() {
        [dailyCollectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            dailyCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            dailyCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            dailyCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            dailyCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}
