//
//  CommentViewController.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/25.
//

import UIKit

final class CommentViewController: UIViewController {
    private let commentTableView = UITableView()
    private let commentTextView: UITextView = {
        let textView = UITextView()
        textView.textContainerInset = .zero
        return textView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = CommunityProfileImageView()
        return imageView
    }()
    
    override func viewDidLoad() {
        configureCommentTableView()
        configureSubview()
        configureLayout()
    }
}

// MARK: PanModal Presentable Imaplementation
extension CommentViewController: PanModalPresentable {
    var scrollView: UIScrollView? {
        return commentTableView
    }
    
    var stickyView: UIView? {
        return commentTextView
    }
}

// MARK: UITableView DataSource Implementation
extension CommentViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: Configure TableView
extension CommentViewController {
    private func configureCommentTableView() {
        commentTableView.dataSource = self
        commentTableView.register(
            CommentCell.self,
            forCellReuseIdentifier: CommentCell.reuseIdentifier
        )
    }
}

// MARK: Configure UI
extension CommentViewController {
    private func configureSubview() {
        view.addSubview(commentTableView)
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: commentTableView Constraint
            commentTableView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            commentTableView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            commentTableView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            commentTableView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            ),
        ])
    }
}

