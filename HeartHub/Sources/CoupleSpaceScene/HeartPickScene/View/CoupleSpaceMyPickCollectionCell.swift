//
//  CoupleSpaceMyPickCollectionCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/03.
//

import UIKit

final class CoupleSpaceMyPickCollectionCell: CoupleSpaceHeartPickCollectionCell {
    private let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "HeartHubFillHeart"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureHeartButton()
        configureHeartButtonLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure UI
extension CoupleSpaceMyPickCollectionCell {
    private func configureHeartButton() {
        contentView.addSubview(heartButton)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureHeartButtonLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            heartButton.topAnchor.constraint(
                equalTo: safeArea.topAnchor,
                constant: 12
            ),
            heartButton.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -12
            ),
        ])
    }
}
