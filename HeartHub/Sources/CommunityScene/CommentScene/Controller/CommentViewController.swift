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
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 40)
        textView.font = .systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        textView.backgroundColor = .green
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 1
        return textView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = HeartHubProfileImageView()
        return imageView
    }()
    
    private let commentStickyView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        return view
    }()
    
    private let commentPostButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.setImage(UIImage(systemName: "paperplane"), for: .disabled)
        return button
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        configureCommentTableView()
        configureCommentTextView()
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
        return commentStickyView
    }
    
    var isStickyViewFirstResponder: Bool {
        return commentTextView.isFirstResponder
    }
    
    func canRespond(to panModalGestureRecognizer: UIPanGestureRecognizer) -> Bool {
        let location = panModalGestureRecognizer.location(in: view)
        return headerView.frame.contains(location)
    }
    
    func resignStickyViewFirstResponder() {
        commentTextView.resignFirstResponder()
    }
}

// MARK: UITableView DataSource Implementation
extension CommentViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return mockData.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CommentCell.reuseIdentifier,
            for: indexPath
        ) as? CommentCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(mockData[indexPath.row])
        
        return cell
    }
}

// MARK: UITextView Delegate Implementation
extension CommentViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        if estimatedSize.height > 60 {
            textView.isScrollEnabled = true
        } else if estimatedSize.height <= 60 {
            textView.isScrollEnabled = false
        }
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

// MARK: Configure TextView
extension CommentViewController {
    private func configureCommentTextView() {
        commentTextView.delegate = self
    }
}

// MARK: Configure UI
extension CommentViewController {
    private func configureSubview() {
        [profileImageView, commentTextView, commentPostButton].forEach {
            commentStickyView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [commentTableView, headerView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = .systemBackground
        commentTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: headerView Constraint
            headerView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            headerView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            headerView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            headerView.heightAnchor.constraint(
                equalToConstant: 80
            ),
            
            // MARK: commentTableView Constraint
            commentTableView.topAnchor.constraint(
                equalTo: headerView.bottomAnchor
            ),
            commentTableView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            commentTableView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            commentTableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -100
            ),
            
            // MARK: profileImageView Constraint
            profileImageView.leadingAnchor.constraint(
                equalTo: commentStickyView.leadingAnchor,
                constant: 15
            ),
            profileImageView.centerYAnchor.constraint(
                equalTo: commentStickyView.centerYAnchor
            ),
            profileImageView.widthAnchor.constraint(
                equalTo: commentStickyView.widthAnchor,
                multiplier: 0.1
            ),
            profileImageView.heightAnchor.constraint(
                equalTo: profileImageView.widthAnchor
            ),
            
            // MARK: commentTextView Constraint
            commentTextView.leadingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor,
                constant: 8
            ),
            commentTextView.trailingAnchor.constraint(
                equalTo: commentStickyView.trailingAnchor,
                constant: -15
            ),
            commentTextView.bottomAnchor.constraint(
                equalTo: profileImageView.bottomAnchor
            ),
            commentTextView.heightAnchor.constraint(
                lessThanOrEqualToConstant: 60
            ),
            
            // MARK: commentPostButton Constraint
            commentPostButton.trailingAnchor.constraint(
                equalTo: commentTextView.trailingAnchor,
                constant: -4
            ),
            commentPostButton.bottomAnchor.constraint(
                equalTo: commentTextView.bottomAnchor,
                constant: -4
            ),
        ])
    }
}

