//
//  ProfileDateViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/03.
//

import UIKit

final class ProfileDateViewController: UIViewController {
  
    private lazy var profileDateCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    private var profileDatePostArray: [ProfileDatePostDataModel] = []
    private var profileDatePostDataManager = ProfileDatePostDataManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserPostCollectionView()
        configureSubview()
        configureLayout()
    }
}

// MARK: ProfileViewController DataSource Implementation
extension ProfileDateViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileDatePostArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let post = profileDatePostArray[indexPath.item]
        
        if post.profileDatePostImage == nil {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfilePostTextCollectionViewCell.reuseIdentifier,
                for: indexPath)
                    as? ProfilePostTextCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.profilePostText.text = profileDatePostArray[indexPath.item].profileDatePostText
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfilePostImageCollectionViewCell.reuseIdentifier,
                for: indexPath)
                    as? ProfilePostImageCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.profilePostImage.image = profileDatePostArray[indexPath.item].profileDatePostImage
           
            return cell
        }
    }
}
    
    // MARK: Configure CollectionView
    extension ProfileDateViewController {
        private func configureUserPostCollectionView() {
            profileDateCollectionView.dataSource = self
            
            profileDateCollectionView.register(ProfilePostImageCollectionViewCell.self, forCellWithReuseIdentifier: ProfilePostImageCollectionViewCell.reuseIdentifier)
            profileDateCollectionView.register(ProfilePostTextCollectionViewCell.self, forCellWithReuseIdentifier: ProfilePostTextCollectionViewCell.reuseIdentifier)
            
            profileDateCollectionView.backgroundColor = .clear
            
            profileDatePostDataManager.configureProfilePostData()
            profileDatePostArray = profileDatePostDataManager.fetchProfileDatePostData()
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
    extension ProfileDateViewController {
        private func configureSubview() {
            view.addSubview(profileDateCollectionView)
            profileDateCollectionView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        private func configureLayout() {
            let safeArea = view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                
                // MARK: userPostCollectionView Constraints
                profileDateCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
                profileDateCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
                profileDateCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
                profileDateCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
            ])
        }
    }
