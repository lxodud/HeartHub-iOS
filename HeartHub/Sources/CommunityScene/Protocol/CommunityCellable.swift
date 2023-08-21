//
//  DailyDateCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/19.
//

import UIKit

protocol CommunityCellable: UICollectionViewCell, CommunityCellHeaderViewDelegate, CommunityCellBottomButtonViewDelegate {
    var delegate: CommunityCellDelegate? { get set }
    
    func fetchAdjustedHeight() -> CGFloat
    func configureCell(_ data: Article)
}

// MARK: Profile View Delegate Implementation
extension CommunityCellable {
    func didTapUserProfile() {
        delegate?.didTapUserProfile()
    }
    
    func didTapPostOptionButton() {
        delegate?.didTapPostOption()
    }
}

// MARK: BottomButton Delegate Implementation
extension CommunityCellable {
    func didTapThumbButton() {
        delegate?.didTapThumbButton()
    }
    
    func didTapCommentButton() {
        delegate?.didTapCommentButton()
    }
    
    func didTapHeartButton() {
        delegate?.didTapHeartButton()
    }
}
