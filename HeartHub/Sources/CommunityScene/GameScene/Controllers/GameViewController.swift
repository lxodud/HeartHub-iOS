//
//  CommunityGameViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/02.
//

import UIKit

final class GameViewController: UIViewController {
    
    private let gameMissionTableView = UITableView()
    private let gameMissionTableViewCell = GameMissionTableViewCell()
    
    var missionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("미션", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "DungGeunMo", size: 20)
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
        button.titleLabel?.font = UIFont.init(name: "DungGeunMo", size: 20)
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
    
    private var missionDataArray: [String] = []
    private var missionDataManager = GameMissionDataManager()
    
    override func loadView() {
        view = GameBackgroundView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubview()
        configureLayout()
        configureGameMissionTableView()
        configureGameMissionTableViewLayout()
    }
}

// MARK: DataSource Implement
extension GameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameMissionCell", for: indexPath)
                as? GameMissionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.gameMissionLabel.text = missionDataArray[indexPath.item]
        
        return cell
    }
}

// MARK: Configure TableView
extension GameViewController {
    private func configureGameMissionTableView() {
        gameMissionTableView.dataSource = self
        gameMissionTableView.register(GameMissionTableViewCell.self, forCellReuseIdentifier: "GameMissionCell")
        missionDataManager.configureMissionData()
        missionDataArray = missionDataManager.fetchGameMissionData()
        
        gameMissionTableView.contentSize.height = 80
        gameMissionTableView.separatorStyle = .none
    }
    
    private func configureGameMissionTableViewLayout() {
        view.addSubview(gameMissionTableView)
        gameMissionTableView.backgroundColor = .clear
        gameMissionTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gameMissionTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameMissionTableView.topAnchor.constraint(equalTo: gameButtonStackView.bottomAnchor, constant: 43),
            gameMissionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            gameMissionTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25)
        ])
    }
}


// MARK: Configure UI
extension GameViewController {
    private func configureSubview() {
        [missionButton,
         gameClearButton].forEach {
            gameButtonStackView.addArrangedSubview($0)
        }
        
        [gameButtonStackView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: gameButtonStackView Constraints
            gameButtonStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            gameButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameButtonStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 76),
            gameButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
}
