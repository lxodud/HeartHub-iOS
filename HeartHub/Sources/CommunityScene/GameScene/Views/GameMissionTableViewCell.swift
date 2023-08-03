//
//  GameMissionTableViewCell.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/02.
//

import UIKit

class GameMissionTableViewCell: UITableViewCell {

    private lazy var buttonShadowView: UIView = {
         let view = UIView()
         view.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1).cgColor
         view.layer.shadowOpacity = 1.0
         view.layer.shadowOffset = CGSize(width: 0, height: 4)
         view.layer.shadowRadius = 4
         view.addSubview(gameMissionButton)
         return view
     }()

    let gameMissionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "MissionCheckButtonImage"), for: .normal)
        button.setImage(UIImage(named: "MissionUnCheckButtonImage"), for: .selected)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 16)
        button.titleLabel?.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.contentMode = .center
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureSubview()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure UI
extension GameMissionTableViewCell {
    
    private func configureSubview() {
        self.contentView.addSubview(buttonShadowView)
        buttonShadowView.translatesAutoresizingMaskIntoConstraints = false
        gameMissionButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            gameMissionButton.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            gameMissionButton.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            gameMissionButton.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            gameMissionButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        ])
    }
}

