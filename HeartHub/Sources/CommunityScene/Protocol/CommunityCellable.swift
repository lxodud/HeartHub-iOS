//
//  DailyDateCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/19.
//

import UIKit

protocol CommunityCellable: UICollectionViewCell, CommunityCellHeaderViewDelegate, CommunityCellBottomButtonViewDelegate {
    var transitionDelegate: CommunityCellTransitionDelegate? { get set }
    var communityCellDataSource: CommunityCellDataSource? { get set }
    
    func fetchAdjustedHeight() -> CGFloat
}

// MARK: Profile View Delegate Implementation
extension CommunityCellable {
    func didTapUserProfile() {
        transitionDelegate?.didTapUserProfile()
    }
    
    func didTapPostOptionButton() {
        transitionDelegate?.didTapPostOption()
    }
}

// MARK: BottomButton Delegate Implementation
extension CommunityCellable {
    func didTapThumbButton(_ status: Bool) {
        communityCellDataSource?.checkGoodArticle(status)
    }
    
    func didTapCommentButton() {
        let articleID = communityCellDataSource?.article.articleID
        transitionDelegate?.didTapCommentButton(articleID)
    }
    
    func didTapHeartButton(_ status: Bool) {
        communityCellDataSource?.scrapOrCancelArticle(status)
    }
}
