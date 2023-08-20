//
//  ProfileReoportUserView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/20.
//

import UIKit

class ProfileReportUserView: UIView {
    
    private var userNickName: String = "우리자기 사랑행"
    
    private lazy var userNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = userNickName + "\n 님을 차단하시겠습니까?"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .black
        return label
    }()

    private let reportDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "계정 차단 시 해당 계정 게시물과 댓글이 더이상 보이지 않고, 본인 스크랩에 해당 계정의 게시물이 있다면 스크랩 목록에서 삭제됩니다."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textColor = .black
        return label
    }()

    var profileReportCancelButton = AlertButton(buttonColor: .white, borderColor: #colorLiteral(red: 0.9803773761, green: 0.1853338182, blue: 0.7394250631, alpha: 1), title: "취소", titleColor: .black)
    var profileReportBlockButton = AlertButton(buttonColor: .red, borderColor: #colorLiteral(red: 1, green: 0, blue: 0.008081941865, alpha: 1), title: "차단", titleColor: .white)

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileReportCancelButton, profileReportBlockButton])
        stackView.axis = .horizontal
        stackView.spacing = 42
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [userNickNameLabel, reportDescriptionLabel])
        stView.axis = .vertical
        stView.spacing = 36
        stView.alignment = .fill
        stView.distribution = .fill
        return stView
    }()

    lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        return view
    }()

    // MARK: 뷰 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.2)
        configureSubviews()
        configureConstraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: 제약
    private func configureSubviews() {
        [labelStackView, buttonStackView].forEach {
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
            containerView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 177),
            containerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -190),
            containerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),

            labelStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            labelStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            labelStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 41),

            buttonStackView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.0883),
            buttonStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -48),
            buttonStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 55),
        ])
    }
}

// MARK: 프리뷰
import SwiftUI
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return     UINavigationController(rootViewController: ProfileReportUserViewController())
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
        typealias  UIViewControllerType = UIViewController
    }
}
