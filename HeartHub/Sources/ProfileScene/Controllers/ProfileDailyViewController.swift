//
//  ProfileDailyViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/03.
//

import UIKit

final class ProfileDailyViewController: UIViewController {
  
    private lazy var profileDailyCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    private var profileDailyPostArray: [ProfileDailyPostDataModel] = []
    private var profileDailyPostDataManager = ProfileDailyPostDataManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserPostCollectionView()
        configureSubview()
        configureLayout()
    }
}

// MARK: ProfileViewController DataSource Implementation
extension ProfileDailyViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileDailyPostArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let post = profileDailyPostArray[indexPath.item]
        
        if post.profileDailyPostImage == nil {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfilePostTextCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as? ProfilePostTextCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.profilePostText.text = profileDailyPostArray[indexPath.item].profileDailyPostText

            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfilePostImageCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as? ProfilePostImageCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.profilePostImage.image = profileDailyPostArray[indexPath.item].profileDailyPostImage
            
            return cell
        }
    }
}

// MARK: Configure CollectionView
extension ProfileDailyViewController {
    private func configureUserPostCollectionView() {
        profileDailyCollectionView.dataSource = self
        
        profileDailyCollectionView.register(ProfilePostImageCollectionViewCell.self, forCellWithReuseIdentifier: ProfilePostImageCollectionViewCell.reuseIdentifier)
        profileDailyCollectionView.register(ProfilePostTextCollectionViewCell.self, forCellWithReuseIdentifier: ProfilePostTextCollectionViewCell.reuseIdentifier)

        
        profileDailyCollectionView.backgroundColor = .clear
        
        profileDailyPostDataManager.configureProfilePostData()
        profileDailyPostArray = profileDailyPostDataManager.fetchProfileDailyPostData()
    }
        
    private func generateCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalWidth(1/3)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1/3)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

// MARK: Configure UI
extension ProfileDailyViewController {
    private func configureSubview() {
        view.addSubview(profileDailyCollectionView)
        profileDailyCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            // MARK: userPostCollectionView Constraints
            profileDailyCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profileDailyCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            profileDailyCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            profileDailyCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}
