//
//  DailyDateCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/19.
//

import UIKit

protocol CommunityCellable: UICollectionViewCell, CommunityCellHeaderViewDelegate, CommunityCellBottomButtonViewDelegate {
    var delegate: CommunityCellDelegate? { get set }
    var communityCellDataSource: CommunityCellDataSource? { get set }
    
    func fetchAdjustedHeight() -> CGFloat
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
    func didTapThumbButton(_ status: Bool) {
        communityCellDataSource?.checkGoodArticle(status)
    }
    
    func didTapCommentButton() {
        delegate?.didTapCommentButton()
    }
    
    func didTapHeartButton() {
        delegate?.didTapHeartButton()
    }
}
