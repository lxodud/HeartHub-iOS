//
//  DailyViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/06.
//

import UIKit

final class DailyViewController: UIViewController {
    private let dailyCollectionView = UICollectionView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: Configure CollectionView
extension DailyViewController {
    private func configureDailyCollectionView()  {
        dailyCollectionView.collectionViewLayout = generateCollectionViewLayout()
        view.addSubview(dailyCollectionView)
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
