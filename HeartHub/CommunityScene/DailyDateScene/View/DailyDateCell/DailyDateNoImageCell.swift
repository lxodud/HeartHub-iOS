//
//  DailyDateCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/19.
//

import UIKit

final class DailyDateNoImageCell: UICollectionViewCell, DailyDateCellable {
    weak var delegate: DailyDateCellDelegate?
    
    private let profileView = CommunityCellProfileView()
    private let bottomButtonView = CommunityCellBottomButtonView()
    private let postLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchAdjustedHeight() -> CGFloat {
        var height = profileView.bounds.height
        height += postLabel.bounds.height
        height += bottomButtonView.bounds.height
        
        return height
    }
    
    func configureCell(_ data: MockData) {
        profileView.configureContents(data)
        postLabel.text = data.postLabel
    }
}

// MARK: Configure UI
extension DailyDateNoImageCell {
    private func configureSubview() {
        [profileView, postLabel, bottomButtonView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        profileView.delegate = self
        bottomButtonView.delegate = self
    }
    
    private func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: profileView Constraint
            profileView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            profileView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 12
            ),
            profileView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -12
            ),
            profileView.heightAnchor.constraint(
                equalTo: profileView.widthAnchor,
                multiplier: 0.15
            ),
            
            // MARK: postLabel Constraint
            postLabel.topAnchor.constraint(
                equalTo: profileView.bottomAnchor
            ),
            postLabel.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 12
            ),
            postLabel.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -12
            ),
            postLabel.heightAnchor.constraint(
                equalTo: profileView.heightAnchor,
                multiplier: 2
            ),
            
            // MARK: bottomButtonView Constraint
            bottomButtonView.topAnchor.constraint(
                equalTo: postLabel.bottomAnchor
            ),
            bottomButtonView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 3
            ),
            bottomButtonView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -3
            ),
            bottomButtonView.heightAnchor.constraint(
                equalTo: profileView.heightAnchor
            )
        ])
    }
}
