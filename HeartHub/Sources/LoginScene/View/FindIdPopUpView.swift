//
//  heartHubModalView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/16.
//

import UIKit

final class FindIdPopUpView: UIView {
    
    let screenHeight = UIScreen.main.bounds.size.height

    private var userNickName: String = "heartHuB"
    private var userId: String = "zizlp0018"
    
    // MARK: 레이블
    private lazy var userNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = userNickName + "님의 아이디는"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .black
        return label
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = userId
        label.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .black
        return label
    }()
    
    private lazy var endLabel: UILabel = {
        let label = UILabel()
        label.text = "입니다"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .black
        return label
    }()
    
    // MARK: 닫기버튼
    lazy var closeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 18
        btn.layer.borderColor = #colorLiteral(red: 0.9803773761, green: 0.1853338182, blue: 0.7394250631, alpha: 1)
 
        btn.setTitle("닫기", for: .normal)
        btn.titleLabel?.font = UIFont.init(name: "Pretendard-Regular", size: 14)
        btn.titleLabel?.textAlignment = .center
        btn.setTitleColor(UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 1), for: .normal)
        btn.sizeToFit()
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.titleLabel?.numberOfLines = 1
        
        btn.layer.shadowColor = UIColor(red: 0.98, green: 0.184, blue: 0.741, alpha: 0.25).cgColor
        btn.layer.shadowOpacity = 1.0
        btn.layer.shadowOffset = CGSize(width: 0, height: 4)
        btn.layer.shadowRadius = 6
        
        
        return btn
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [userNickNameLabel, idLabel, endLabel, closeBtn])
        stView.axis = .vertical
        stView.spacing = 45.84
        stView.setCustomSpacing(78, after: endLabel)
        stView.alignment = .center
        stView.distribution = .fillEqually
        return stView
    }()
    
    
    lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.addSubview(labelStackView)
        return view
    }()
    
    // MARK: 뷰 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.2)
        addViews()
        constraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 제약
    func addViews() {
//        [labelStackView,
//        closeBtn].forEach { addSubview($0) }
        addSubview(containerView)
    }
    
    private func constraints() {
        labelStackViewConstraints()
        closeBtnConstraints()
        containerViewConstraints()
    }

    
    private func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 138),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -163),
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
    }
    
    private func labelStackViewConstraints() {
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            labelStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 119),
            labelStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            labelStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
        ])
    }
    
    private func closeBtnConstraints() {
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeBtn.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            closeBtn.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.08),
            closeBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
        ])
    }
}
