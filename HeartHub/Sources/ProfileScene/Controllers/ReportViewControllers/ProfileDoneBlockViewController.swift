//
//  ProfileDoneBlockViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/20.
//

import UIKit

final class ProfileDoneBlockViewController: UIViewController {

    let profileDoneBlockView = ProfileDoneBlockView()
    
    override func loadView() {
        view = profileDoneBlockView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
