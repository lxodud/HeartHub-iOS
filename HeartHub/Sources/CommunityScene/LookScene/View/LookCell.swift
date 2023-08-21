//
//  LookCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/20.
//

import UIKit

final class LookCell: UICollectionViewCell, CommunityCellable {
    weak var delegate: CommunityCellDelegate?
    
    private let headerView = CommunityCellHeaderView()
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
    
    func configureCell(_ data: Article) {
        headerView.configureContents(data)
    }
}

// MARK: Configure UI
extension LookCell {
    private func configureSubview() {
        [headerView, pagingImageView, bottomButtonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(pagingImageView)
        pagingImageView.addSubview(headerView)
        pagingImageView.addSubview(bottomButtonView)
        
        headerView.delegate = self
        bottomButtonView.delegate = self
    }
    
    private func configureLayout() {
        let contentViewSafeArea = contentView.safeAreaLayoutGuide
        let pagingImageViewSafeArea = pagingImageView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: profileView Constraint
            headerView.topAnchor.constraint(
                equalTo: pagingImageViewSafeArea.topAnchor
            ),
            headerView.leadingAnchor.constraint(
                equalTo: pagingImageViewSafeArea.leadingAnchor,
                constant: 12
            ),
            headerView.trailingAnchor.constraint(
                equalTo: pagingImageViewSafeArea.trailingAnchor,
                constant: -12
            ),
            headerView.heightAnchor.constraint(
                equalTo: headerView.widthAnchor,
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
                equalTo: headerView.heightAnchor
            )
        ])
        
    }
}
