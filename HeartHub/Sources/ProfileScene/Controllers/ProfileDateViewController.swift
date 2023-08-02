//
//  ProfileDateViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/03.
//

import UIKit

class ProfileDateViewController: UIViewController {
  
    private lazy var profileDateCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    private var profilePostArray: [ProfilePostDataModel] = []
    private var postDataManager = ProfilePostDataManager()
   
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
        return profilePostArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PostCell",
            for: indexPath)
                as? ProfilePostCollectionViewCell else {
            return UICollectionViewCell()
                }
        
        cell.postImageView.image = profilePostArray[indexPath.item].postImage
        
        return cell
    }
}


// MARK: Configure CollectionView
extension ProfileDateViewController {
    private func configureUserPostCollectionView() {
        profileDateCollectionView.dataSource = self
        profileDateCollectionView.register(ProfilePostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCell")
        profileDateCollectionView.backgroundColor = .clear
        
        postDataManager.configureProfilePostData()
        profilePostArray = postDataManager.fetchProfilePostData()
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
