//
//  CommentCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/25.
//

import UIKit

protocol CommentCellDelegate: AnyObject {
    func didTapUserProfile()
    func didTapHeartButton()
    func didTapLeaveCommentButton()
}

final class CommentCell: UITableViewCell {
    weak var delegate: CommentCellDelegate?
    
    private let headerView = CommentCellHeaderView()
    private let commentLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let leaveCommentButton: UIButton = {
        let button = UIButton()
        button.setTitle("답글달기", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubview()
        configureLayout()
        configureAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public Interface
extension CommentCell {
    func configureCell(_ data: MockData) {
    }
}

// MARK: Comment Cell HeaderView Delegate Implementation
extension CommentCell: CommentCellHeaderViewDelegate {
    func didTapUserProfile() {
        delegate?.didTapUserProfile()
    }
    
    func didTapHeartButton() {
        delegate?.didTapHeartButton()
    }
}

// MARK: Configure Action
extension CommentCell {
    private func configureAction() {
        leaveCommentButton.addTarget(
            self,
            action: #selector(tapLeaveCommentButton),
            for: .touchUpInside
        )
    }
    
    @objc
    private func tapLeaveCommentButton() {
        delegate?.didTapLeaveCommentButton()
    }
}

// MARK: Configure UI
extension CommentCell {
    private func configureSubview() {
        [headerView, commentLabel, leaveCommentButton].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        let idLabelLeadingAnchor = headerView.idLabelLeadingAnchor
        let heartButtonLeadingAnchor = headerView.heartButtonLeadingAnchor
        
        NSLayoutConstraint.activate([
            // MARK: headerView Constraint
            headerView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            headerView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor,
                constant: 15
            ),
            headerView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor,
                constant: -15
            ),
            headerView.heightAnchor.constraint(
                equalToConstant: 40
            ),
            
            // MARK: commentLabel Constraint
            commentLabel.topAnchor.constraint(
                equalTo: headerView.bottomAnchor
            ),
            commentLabel.leadingAnchor.constraint(
                equalTo: idLabelLeadingAnchor
            ),
            commentLabel.trailingAnchor.constraint(
                equalTo: heartButtonLeadingAnchor
            ),
            
            // MARK: leaveCommentButton Constraint
            leaveCommentButton.topAnchor.constraint(
                equalTo: commentLabel.bottomAnchor
            ),
            leaveCommentButton.leadingAnchor.constraint(
                equalTo: commentLabel.leadingAnchor,
                constant: 30
            ),
            leaveCommentButton.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            )
        ])
    }
}
