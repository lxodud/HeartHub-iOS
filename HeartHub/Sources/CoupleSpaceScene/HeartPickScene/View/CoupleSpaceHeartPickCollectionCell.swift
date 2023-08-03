//
//  CoupleSpaceHeartPickCollectionCell.swift
//  HeartHub
//
//  Created by 이태영 on 2023/08/03.
//

import UIKit

class CoupleSpaceHeartPickCollectionCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public Interface
extension CoupleSpaceHeartPickCollectionCell {
    func configureContents() {
        
    }
}

// MARK: Configure UI
extension CoupleSpaceHeartPickCollectionCell {
    private func configureSubview() {
        [imageView, label].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(imageView)
        imageView.addSubview(label)
    }
    
    private func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: imageView Constraints
            imageView.topAnchor.constraint(
                equalTo: safeArea.topAnchor
            ),
            imageView.leadingAnchor.constraint(
                equalTo: safeArea.leadingAnchor
            ),
            imageView.trailingAnchor.constraint(
                equalTo: safeArea.trailingAnchor
            ),
            imageView.bottomAnchor.constraint(
                equalTo: safeArea.bottomAnchor
            )
        ])
    }
}
