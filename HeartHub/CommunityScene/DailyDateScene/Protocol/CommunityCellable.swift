//
//  DailyDateCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/19.
//

import UIKit

protocol CommunityCellable: UICollectionViewCell, CommunityCellProfileViewDelegate, CommunityCellBottomButtonViewDelegate {
    var delegate: CommunityCellDelegate? { get set }
    
    func fetchAdjustedHeight() -> CGFloat
    func configureCell(_ data: MockData)
}

// MARK: Profile View Delegate Implementation
extension CommunityCellable {
    func didTapUserProfile() {
        delegate?.didTapUserProfile()
    }
    
    func didTapPostOption() {
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
