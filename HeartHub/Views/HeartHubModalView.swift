//
//  heartHubModalView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/16.
//

import UIKit

class HeartHubModalView: UIView {
    
    let screenHeight = UIScreen.main.bounds.size.height

    private var userNickName: String = "유저 닉네임"
    private var userId: String = "유저 아이디"
    
    // MARK: 레이블
    private lazy var userNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = userNickName + "님의 아이디는"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        return label
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = userId
        label.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        return label
    }()
    
    private lazy var endLabel: UILabel = {
        let label = UILabel()
        label.text = "입니다"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [userNickNameLabel, idLabel, endLabel])
        stView.axis = .vertical
        stView.spacing = 45.84
        stView.alignment = .center
        stView.distribution = .fillEqually
        return stView
    }()
    
    // MARK: 닫기버튼
    lazy var closeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 18
        button.layer.borderColor = #colorLiteral(red: 0.9803773761, green: 0.1853338182, blue: 0.7394250631, alpha: 1)
 
        button.setTitle("닫기", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Pretendard-Regular", size: 14)
        button.sizeToFit()
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.numberOfLines = 1
        
        var shadows = UIView()
        shadows.frame = button.frame
        shadows.clipsToBounds = false
        button.addSubview(shadows)
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 18)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0.98, green: 0.184, blue: 0.741, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 4
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        
        return button
    }()
    
    // MARK: 뷰 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addViews()
        constraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 제약
    func addViews() {
        [labelStackView,
        closeBtn].forEach { addSubview($0) }
    }
    
    private func constraints() {
        labelStackViewConstraints()
        closeBtnConstraints()
    }
    
    private func labelStackViewConstraints() {
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor, constant: 119),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func closeBtnConstraints() {
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeBtn.heightAnchor.constraint(equalToConstant: 35),
            closeBtn.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 78),
            closeBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            closeBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
}
