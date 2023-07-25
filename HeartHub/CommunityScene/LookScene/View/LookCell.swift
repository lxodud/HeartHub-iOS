//
//  LookCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/20.
//

import UIKit

final class LookCell: UICollectionViewCell, CommunityCellable {
    weak var delegate: CommunityCellDelegate?
    
    private let profileView = CommunityProfileView()
    private let pagingImageView = CommunityCellPagingImageView()
    private let bottomButtonView = CommunityCellBottomButtonView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public Interface
extension LookCell {
    func fetchAdjustedHeight() -> CGFloat {
        return pagingImageView.bounds.height
    }
    
    func configureCell(_ data: MockData) {
        profileView.configureContents(data)
        pagingImageView.configureContents(data.images)
    }
}

// MARK: Configure UI
extension LookCell {
    private func configureSubview() {
        [profileView, pagingImageView, bottomButtonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(pagingImageView)
        pagingImageView.addSubview(profileView)
        pagingImageView.addSubview(bottomButtonView)
    }
    
    private func configureLayout() {
        let contentViewSafeArea = contentView.safeAreaLayoutGuide
        let pagingImageViewSafeArea = pagingImageView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: profileView Constraint
            profileView.topAnchor.constraint(
                equalTo: pagingImageViewSafeArea.topAnchor
            ),
            profileView.leadingAnchor.constraint(
                equalTo: pagingImageViewSafeArea.leadingAnchor,
                constant: 12
            ),
            profileView.trailingAnchor.constraint(
                equalTo: pagingImageViewSafeArea.trailingAnchor,
                constant: -12
            ),
            profileView.heightAnchor.constraint(
                equalTo: profileView.widthAnchor,
                multiplier: 0.15
            ),
            
            // MARK: pagingImageView Constarint
            pagingImageView.topAnchor.constraint(
                equalTo: contentViewSafeArea.topAnchor
            ),
            pagingImageView.leadingAnchor.constraint(
                equalTo: contentViewSafeArea.leadingAnchor
            ),
            pagingImageView.trailingAnchor.constraint(
                equalTo: contentViewSafeArea.trailingAnchor
            ),
            pagingImageView.bottomAnchor.constraint(
                equalTo: contentViewSafeArea.bottomAnchor
            ),

            
            // MARK: bottomButtonView Constraint
            bottomButtonView.bottomAnchor.constraint(
                equalTo: pagingImageView.bottomAnchor
            ),
            bottomButtonView.leadingAnchor.constraint(
                equalTo: pagingImageViewSafeArea.leadingAnchor,
                constant: 3
            ),
            bottomButtonView.trailingAnchor.constraint(
                equalTo: pagingImageViewSafeArea.trailingAnchor,
                constant: -3
            ),
            bottomButtonView.heightAnchor.constraint(
                equalTo: profileView.heightAnchor
            )
        ])
        
    }
}
