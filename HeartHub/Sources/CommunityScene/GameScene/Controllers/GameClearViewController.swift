//
//  GameClearViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/05.
//

import UIKit

class GameClearViewController: UIViewController {
 
    private let clearMissionTableView = UITableView()
    private var clearMissionTableViewCell = GameMissionTableViewCell()
    
    private var clearMissionDataArray: [String] = []
    private var clearMissionDataManager = GameClearMissionDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureClearMissionTableView()
        configureClearMissionTableViewLayout()


        // Do any additional setup after loading the view.
    }

}

// MARK: DataSource Implement
extension GameClearViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clearMissionDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClearMissionCell", for: indexPath)
                as? GameMissionTableViewCell else {
            return UITableViewCell()
        }
        
        cell.gameMissionLabel.text = clearMissionDataArray[indexPath.item]
        
        return cell
    }
}

// MARK: Configure TableView
extension GameClearViewController {
    private func configureClearMissionTableView() {
        clearMissionTableView.dataSource = self
        clearMissionTableView.register(GameMissionTableViewCell.self, forCellReuseIdentifier: "ClearMissionCell")
        clearMissionDataManager.configureMissionData()
        clearMissionDataArray = clearMissionDataManager.fetchGameMissionData()
        
        clearMissionTableView.contentSize.height = 80
        clearMissionTableView.separatorStyle = .none
    }
    
    
    
    private func configureClearMissionTableViewLayout() {
        view.addSubview(clearMissionTableView)
        clearMissionTableView.backgroundColor = .clear
        clearMissionTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            clearMissionTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            clearMissionTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            clearMissionTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            clearMissionTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

