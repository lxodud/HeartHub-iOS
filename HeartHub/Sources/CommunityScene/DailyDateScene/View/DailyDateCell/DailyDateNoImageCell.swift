//
//  DailyDateCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/19.
//

import UIKit

final class DailyDateNoImageCell: UICollectionViewCell, CommunityCellable {
    weak var delegate: CommunityCellDelegate?
    
    private let headerView = CommunityCellHeaderView()
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
}

// MARK: Public Interface
extension DailyDateNoImageCell {
    func fetchAdjustedHeight() -> CGFloat {
        var height = headerView.bounds.height
        height += postLabel.bounds.height
        height += bottomButtonView.bounds.height
        
        return height
    }
    
    func configureCell(_ data: MockData) {
        headerView.configureContents(data)
        postLabel.text = data.postLabel
    }
}

// MARK: Configure UI
extension DailyDateNoImageCell {
    private func configureSubview() {
        [headerView, postLabel, bottomButtonView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        headerView.delegate = self
        bottomButtonView.delegate = self
    }
    
    private func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: profileView Constraint
            headerView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            headerView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 12
            ),
            headerView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -12
            ),
            headerView.heightAnchor.constraint(
                equalTo: headerView.widthAnchor,
                multiplier: 0.15
            ),
            
            // MARK: postLabel Constraint
            postLabel.topAnchor.constraint(
                equalTo: headerView.bottomAnchor
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
                equalTo: headerView.heightAnchor,
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
                equalTo: headerView.heightAnchor
            )
        ])
    }
}
