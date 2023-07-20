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
        var dummyCell: DailyDateCellable
        
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
        
        let cellType: DailyDateCellable.Type
        
        if mockData[indexPath.row].images.isEmpty {
            cellType = DailyDateNoImageCell.self
        } else {
            cellType = DailyDateImageCell.self
        }
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellType.reuseIdentifier,
            for: indexPath
        ) as? DailyDateCellable else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(mockData[indexPath.row])
        
        return cell
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

struct MockData {
    var images: [UIImage]
    var profileImage: UIImage
    var profileName: String
    var postLabel: String
}

let mockData = [
    MockData(
        images: [UIImage(systemName: "pencil.circle.fill")!,
                UIImage(systemName:"rectangle.portrait.and.arrow.forward.fill")!,
                UIImage(systemName:"rectangle.portrait.and.arrow.forward.fill")!,
                UIImage(systemName:"rectangle.portrait.and.arrow.forward.fill")!,],
        profileImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")!,
        profileName: "안녕",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [],
        profileImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")!,
        profileName: "허허",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [UIImage(systemName: "pencil.circle.fill")!],
        profileImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")!,
        profileName: "히히",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [UIImage(systemName: "pencil.circle.fill")!,
                UIImage(systemName:"rectangle.portrait.and.arrow.forward.fill")!,
                UIImage(systemName:"rectangle.portrait.and.arrow.forward.fill")!,
                UIImage(systemName:"rectangle.portrait.and.arrow.forward.fill")!,],
        profileImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")!,
        profileName: "안녕",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [],
        profileImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")!,
        profileName: "안녕",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    ),
    MockData(
        images: [UIImage(systemName: "pencil.circle.fill")!],
        profileImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")!,
        profileName: "안녕",
        postLabel: "ㅇ아아아ㅏ안매아ㅔㅁ나애ㅔ마네애ㅏㄴㅁ"
    )
]
