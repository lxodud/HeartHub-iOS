//
//  AddPostButtonView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/17.
//

import UIKit

class AddPostButton: UIButton {

    init(text: String) {
        super.init(frame: .zero)

        self.setTitle(text, for: .normal)
        
        configureInitialSetting()
        configureLayout()
        
        if self.isSelected == true {
            self.backgroundColor = .black
        } else {
            self.backgroundColor = .white
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / CGFloat(2)
    }
}

extension AddPostButton {
    private func configureInitialSetting() {
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.white, for: .selected)
        
        titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        clipsToBounds = true
    }
}

// MARK: Configure Layout
extension AddPostButton {
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // MARK: signUpYearTextField Constraints
            centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            topAnchor.constraint(equalTo: safeArea.topAnchor),
            leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        ])
    }
}

