//
//  TermTableViewCell.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/08.
//

import UIKit

final class SignUpTermTableViewCell: UITableViewCell {

    var termAgreeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "AgreeRadioBtnUnChecked"), for: .normal)
        button.setImage(UIImage(named: "AgreeRadioBtnChecked"), for: .selected)
        button.contentMode = .center
        return button
    }()
    
    var termLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    var termDescriptionButton: UIButton = {
        let button = UIButton(type: .system)
        let symbolImage = UIImage(systemName: "chevron.right")
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        configureSubViews()
        configureLayout()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignUpTermTableViewCell {
    private func configureButton() {
        termAgreeButton.addTarget(self, action: #selector(didTapTermAgreeBtn), for: .touchUpInside)
    }

    @objc private func didTapTermAgreeBtn() {
        if termAgreeButton.isSelected == true {
            termAgreeButton.isSelected = false
         } else {
             termAgreeButton.isSelected = true
         }
    }
}

extension SignUpTermTableViewCell {
    private func configureSubViews() {
        [termAgreeButton, termLabel, termDescriptionButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            // MARK: termAgreeButton Constraints
            termAgreeButton.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            termAgreeButton.widthAnchor.constraint(equalTo: heightAnchor),
            termAgreeButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            termAgreeButton.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            termAgreeButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            termAgreeButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            
            // MARK: termLabel Constraints
            termLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            termLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            termLabel.leadingAnchor.constraint(equalTo: termAgreeButton.trailingAnchor, constant: 2),
            
            // MARK: termDescriptionButton Constraints
            termDescriptionButton.heightAnchor.constraint(equalTo: termAgreeButton.heightAnchor, multiplier: 0.35),
            termDescriptionButton.widthAnchor.constraint(equalTo: termAgreeButton.heightAnchor, multiplier: 0.35),
            termDescriptionButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            termDescriptionButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -13),
            ])
    }
}
