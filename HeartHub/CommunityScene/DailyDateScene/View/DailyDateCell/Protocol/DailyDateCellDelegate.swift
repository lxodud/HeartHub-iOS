//
//  DailyDateCellDelegate.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/19.
//

import Foundation

protocol DailyDateCellDelegate: AnyObject {
    // MARK: Profile View Delegate
    func didTapUserProfile()
    func didTapPostOption()
    
    // MARK: Bottom Button View Delegate
    func didTapThumbButton()
    func didTapCommentButton()
    func didTapHeartButton()
}
