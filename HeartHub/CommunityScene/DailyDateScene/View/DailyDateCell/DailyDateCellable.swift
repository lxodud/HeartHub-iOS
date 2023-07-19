//
//  DailyDateCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/19.
//

import UIKit

protocol DailyDateCellDelegate: AnyObject {
    // MARK: Profile View Delegate
    func didTapUserProfile()
    func didTapPostOption()
    
    // MARK: Bottom Button View Delegate
    func didTapThumbButton()
    func didTapCommentButton()
    func didTapHeartButton()
}

protocol DailyDateCellable: UICollectionViewCell, CommunityCellProfileViewDelegate, CommunityCellBottomButtonViewDelegate {
    var delegate: DailyDateCellDelegate? { get set }
    
    func fetchAdjustedHeight() -> CGFloat
}

// MARK: Profile View Delegate Implementation
extension DailyDateCellable {
    func didTapUserProfile() {
        delegate?.didTapUserProfile()
    }
    
    func didTapPostOption() {
        delegate?.didTapPostOption()
    }
}

// MARK: BottomButton Delegate Implementation
extension DailyDateCellable {
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
