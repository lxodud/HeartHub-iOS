//
//  ProfileLookViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/03.
//

import UIKit

final class ProfileLookViewController: UIViewController {
  
    private lazy var profileLookCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    private var profileLookPostArray: [ProfileLookPostDataModel] = []
    private var profileLookPostDataManager = ProfileLookPostDataManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserPostCollectionView()
        configureSubview()
        configureLayout()
    }
}

// MARK: ProfileViewController DataSource Implementation
extension ProfileLookViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileLookPostArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let profileLookPostcell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ProfileLookPostCell",
            for: indexPath)
                as? ProfilePostCollectionViewCell else {
            return UICollectionViewCell()
                }
        
        profileLookPostcell.postImageView.image = profileLookPostArray[indexPath.item].profileLookPostImage
        
        return profileLookPostcell
    }
}

// MARK: Configure CollectionView
extension ProfileLookViewController {
    private func configureUserPostCollectionView() {
        profileLookCollectionView.dataSource = self
        profileLookCollectionView.register(ProfilePostCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileLookPostCell")
        profileLookCollectionView.backgroundColor = .clear
        
        profileLookPostDataManager.configureProfileLookPostData()
        profileLookPostArray = profileLookPostDataManager.fetchProfileLookPostData()
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
extension ProfileLookViewController {
    private func configureSubview() {
        view.addSubview(profileLookCollectionView)
        profileLookCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            // MARK: userPostCollectionView Constraints
            profileLookCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profileLookCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            profileLookCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            profileLookCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
}
