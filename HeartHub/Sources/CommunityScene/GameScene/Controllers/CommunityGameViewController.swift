//
//  CommunityGameViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/02.
//

import UIKit

final class CommunityGameViewController: UIViewController {
    
    private var gameBackgroundView = CommunityGameBackgroundView()
    private let gameMissiontableView = UITableView()
    
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
        configureMissionTableView()
    }
}

// MARK: DataSource Implement
extension CommunityGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension CommunityGameViewController {
    func configureMissionTableView() {
        view.addSubview(gameMissiontableView)
        gameMissiontableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gameMissiontableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameMissiontableView.topAnchor.constraint(equalTo: gameButtonStackView.bottomAnchor, constant: 55),
            gameMissiontableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -113),
            gameMissiontableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25)
        ])
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
