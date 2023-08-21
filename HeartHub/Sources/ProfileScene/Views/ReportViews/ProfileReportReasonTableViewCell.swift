//
//  ProfileRePortResonTableViewCell.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/20.
//

import UIKit

final class ProfileReportReasonTableViewCell: UITableViewCell {

    var reasonCheckButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "RadioBtnUnChecked"), for: .normal)
        button.setImage(UIImage(named: "RadioBtnChecked"), for: .selected)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    var reportReasonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
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

extension ProfileReportReasonTableViewCell {
    private func configureButton() {
        reasonCheckButton.addTarget(self, action: #selector(didTapMissionButton), for: .touchUpInside)
    }
    
    @objc private func didTapMissionButton() {
        
        if reasonCheckButton.isSelected == true {
            reasonCheckButton.isSelected = false
        } else {
            reasonCheckButton.isSelected = true
        }
    }
}

extension ProfileReportReasonTableViewCell {
    private func configureSubViews() {
        [reasonCheckButton, reportReasonLabel].forEach {
            self.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let contentView = self.contentView
        NSLayoutConstraint.activate([
            // MARK: termAgreeButton Constraints
            reasonCheckButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            reasonCheckButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            reasonCheckButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            // MARK: termLabel Constraints
            reportReasonLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            reportReasonLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            reportReasonLabel.leadingAnchor.constraint(equalTo: reasonCheckButton.trailingAnchor, constant: 9),
            ])
    }
}
