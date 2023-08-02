//
//  CommunityGameViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/02.
//

import UIKit

final class CommunityGameViewController: UIViewController {
    
    private var gameBackgroundView = CommunityGameBackgroundView()
    
    var gameMissionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("미션", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-SemiBold", size: 20)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .selected)
        button.backgroundColor =  .clear
        button.setBackgroundImage(UIImage(named: "GameButtonSelectedBackground"), for: .selected)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    var gameClearButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("클리어", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-SemiBold", size: 20)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .selected)
        button.backgroundColor =  .clear
        button.setBackgroundImage(UIImage(named: "GameButtonSelectedBackground"), for: .selected)
        button.contentVerticalAlignment = .center
        return button
    }()
    
    private var gameButtonStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubview()
        configureLayout()

    }
}


// MARK: Configure UI
extension CommunityGameViewController {
    private func configureSubview() {
        [gameMissionButton,
         gameClearButton].forEach {
            gameButtonStackView.addArrangedSubview($0)
        }
        
        [gameBackgroundView,
         gameButtonStackView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: BackgroundView Constraints
            gameBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gameBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            gameBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            // MARK: gameButtonStackView Constraints
            gameButtonStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            gameButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameButtonStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 76),
            gameButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
}
