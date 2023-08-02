//
//  ProfileViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/01.
//

import UIKit

final class ProfileViewController: UIViewController {

    private let profileBackgroundView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.image = UIImage(named: "ProfileBackground.png")
        return imgView
    }()
    
    private var userProfileView = ProfileUserView()
    private var userData = ProfileUserDataModel(
        profileImage: UIImage(named: "TestImage"),
        profileNickName: "하트허브하트허브",
        profileInformaition: "하트허브의 프로필설명란"
        )
    private var userDataManager = ProfileUserDataManager()

    private lazy var userPostCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: generateCollectionViewLayout()
    )
    private var profilePostArray: [ProfilePostDataModel] = []
    private var postDataManager = ProfilePostDataManager()
    
    private let profileFloatingButton = CommunityFloatingButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserProfileData()
        configureUserPostCollectionView()
        configureSubview()
        configureLayout()
        configureFloatingButtonInitialSetting()
        configureFloatingButtonLayout()
    }
}

// MARK: ProfileViewController DataSource Implementation
extension ProfileViewController: UICollectionViewDataSource {

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
extension ProfileViewController {
    private func configureUserPostCollectionView() {
        userPostCollectionView.dataSource = self
        userPostCollectionView.register(ProfilePostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCell")
        userPostCollectionView.backgroundColor = .clear
        
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

// MARK: Configure UserProfile Data
extension ProfileViewController {
    func configureUserProfileData() {
        userDataManager.configureProfileUserData()
        userProfileView.profileImageView.image = userData.profileImage
        userProfileView.profileNickNameLabel.text = userData.profileNickName
        userProfileView.profileInformationLabel.text = userData.profileInformaition
        
    }
}

// MARK: Configure Floating Button
extension ProfileViewController {
    private func configureFloatingButtonInitialSetting() {
        view.addSubview(profileFloatingButton)
        profileFloatingButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureFloatingButtonLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileFloatingButton.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor,
                constant: -21
            ),
            profileFloatingButton.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -21
            )
        ])
    }
}

// MARK: Configure UI
extension ProfileViewController {
    private func configureSubview() {
        [profileBackgroundView,
        userPostCollectionView,
         userProfileView
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            profileBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            profileBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            profileBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            // MARK: userProfileView Constraints
            userProfileView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.32),
            userProfileView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            userProfileView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userProfileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 69),
            userProfileView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            // MARK: userPostCollectionView Constraints
            userPostCollectionView.topAnchor.constraint(equalTo: userProfileView.bottomAnchor, constant: 10),
            userPostCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            userPostCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            userPostCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: 프리뷰
import SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return     UINavigationController(rootViewController: ProfileViewController())
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
        typealias  UIViewControllerType = UIViewController
    }
}
