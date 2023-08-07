//
//  SignUpChangePageButtonView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/07.
//

import UIKit

final class SignUpChangePageButtonView: UIButton {

    private var ChangePageButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = false
        button.setImage(UIImage(named: "LeftArrow"), for: .normal)
        button.contentMode = .center
        return button
    }()
    
    init(buttonImage: String) {
        super.init(frame: .zero)
        ChangePageButton.setImage(UIImage(named: buttonImage), for: .normal)
        
        
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignUpChangePageButtonView {
    private func configureSubviews() {
        [ChangePageButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // MARK: ChangePageButton Constraints
            ChangePageButton.topAnchor.constraint(equalTo: safeArea.topAnchor),
            ChangePageButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            ChangePageButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            ChangePageButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
    }
}



