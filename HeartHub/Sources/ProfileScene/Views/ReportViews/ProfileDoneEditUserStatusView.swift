//
//  ProfileDoneReportView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/20.
//

import UIKit
final class ProfileDoneEditUserStatusView: UIView {
    
    private lazy var doneMainLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .black
        return label
    }()
    
    private let doneCheckImage: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "ReportCheck")
        return imgView
    }()
    
    private var bottomDoneReportLabel: UILabel = {
        let label = UILabel()
        label.text = "더욱 완벽한 HeartHub가\n 되도록 하겠습니다."
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .black
        return label
    }()
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        return view
    }()
    
    var profileDoneCloseButton = AlertButton(buttonColor: .white, borderColor: #colorLiteral(red: 0.9803773761, green: 0.1853338182, blue: 0.7394250631, alpha: 1), title: "닫기", titleColor: .black)
    
    // MARK: 뷰 초기화
    init(mainText: String) {
        super.init(frame: .zero)

        doneMainLabel.text = mainText
        backgroundColor = UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.2)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure Layout
extension ProfileDoneEditUserStatusView {
    // MARK: 제약
    private func configureSubviews() {
        [doneMainLabel, doneCheckImage, bottomDoneReportLabel, profileDoneCloseButton].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureConstraints() {
        
        let safeArea = safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 151),
            containerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -159),
            containerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            
            doneMainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            doneMainLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            doneMainLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            
            doneCheckImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            doneCheckImage.topAnchor.constraint(equalTo: doneMainLabel.bottomAnchor, constant: 25),
            doneCheckImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 87),

            bottomDoneReportLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomDoneReportLabel.topAnchor.constraint(equalTo: doneCheckImage.bottomAnchor, constant: 25),
            bottomDoneReportLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            
            profileDoneCloseButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileDoneCloseButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            profileDoneCloseButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
        ])
    }
}
