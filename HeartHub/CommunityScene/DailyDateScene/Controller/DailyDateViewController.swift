//
//  DailyViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/06.
//

import UIKit

final class DailyDateViewController: UIViewController {
    private let dailyCollectionView: UICollectionView = {
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
        configureDailyCollectionView()
        configureSubview()
        configureLayout()
    }
}

// MARK: UICollectionView Delegate FlowLayout Implementation
extension DailyDateViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = view.frame.width
        let estimateHeight = view.frame.height
        let size = CGRect(x: 0, y: 0, width: width, height: estimateHeight)
        var dummyCell: CommunityCellable
        
        if mockData[indexPath.row].images.isEmpty {
            dummyCell = DailyDateNoImageCell(frame: size)
        } else {
            dummyCell = DailyDateImageCell(frame: size)
        }
        
        dummyCell.layoutIfNeeded()
        
        let height = dummyCell.fetchAdjustedHeight()
        
        return CGSize(width: width, height: height)
    }
}

// MARK: UICollectionView DataSource Implementation
extension DailyDateViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        return mockData.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cellType: CommunityCellable.Type
        
        if mockData[indexPath.row].images.isEmpty {
            cellType = DailyDateNoImageCell.self
        } else {
            cellType = DailyDateImageCell.self
        }
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellType.reuseIdentifier,
            for: indexPath
        ) as? CommunityCellable else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(mockData[indexPath.row])
        cell.delegate = self
        
        return cell
    }
}

// MARK: Community Cell Delegate Implementation
extension DailyDateViewController: CommunityCellDelegate {
    func didTapUserProfile() {
        
    }
    
    func didTapPostOption() {
        
    }
    
    func didTapThumbButton() {
        
    }
    
    func didTapCommentButton() {
        let commentViewController = CommentViewController()
        commentViewController.modalPresentationStyle = .custom
        commentViewController.transitioningDelegate = PanModalTransitioningDelegate.shared
        
        present(commentViewController, animated: true)
    }
    
    func didTapHeartButton() {
        
    }
}

// MARK: Configure CollectionView
extension DailyDateViewController {
    private func configureDailyCollectionView()  {
        dailyCollectionView.dataSource = self
        dailyCollectionView.delegate = self
        
        dailyCollectionView.register(
            DailyDateImageCell.self,
            forCellWithReuseIdentifier: DailyDateImageCell.reuseIdentifier
        )
        dailyCollectionView.register(
            DailyDateNoImageCell.self,
            forCellWithReuseIdentifier: DailyDateNoImageCell.reuseIdentifier
        )
    }
}

// MARK: Configure UI
extension DailyDateViewController {
    private func configureSubview() {
        view.addSubview(dailyCollectionView)
        dailyCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            dailyCollectionView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            dailyCollectionView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            dailyCollectionView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            dailyCollectionView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            ),
        ])
    }
}
