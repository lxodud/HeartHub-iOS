//
//  SignUp4View.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit

final class SignUpTermAgreeView: UIView {
    
    let unCheckedImg = UIImage(named: "AgreeRadioBtnUnChecked")
    
    private let signUpBackgroundView = SignUpBackgroundView(
        heartImage: "HeartIcon3:3",
        ourStartLabelText: "사랑을 시작해볼까요?",
        descriptionLabelText: "계정을 생성하여 HeartHuB를 즐겨보아요.")
    
    let signUpTermAgreePreviousPageButton = SignUpChangePageButton(buttonImage: "LeftArrow")
    
    let createAccountButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 18
        btn.layer.borderColor = #colorLiteral(red: 0.9803773761, green: 0.1853338182, blue: 0.7394250631, alpha: 1)
 
        btn.setTitle("계정 생성하기", for: .normal)
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
    

    // MARK: 뷰 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureSubViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SignUpTermAgreeView {
    func configureSubViews() {
        [signUpBackgroundView,
         signUpTermAgreePreviousPageButton,
         createAccountButton
        ].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // MARK: 제약
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            // MARK: signUpBackgroundView Constraints
            signUpBackgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor),
            signUpBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            signUpBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            // MARK: changePageButton Constraints
            signUpTermAgreePreviousPageButton.heightAnchor.constraint(equalTo: signUpTermAgreePreviousPageButton.widthAnchor),
            signUpTermAgreePreviousPageButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -33),
            signUpTermAgreePreviousPageButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            signUpTermAgreePreviousPageButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -33),

            
            createAccountButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066),
            createAccountButton.topAnchor.constraint(equalTo: signUpTermAgreePreviousPageButton.topAnchor),
            createAccountButton.leadingAnchor.constraint(equalTo: signUpTermAgreePreviousPageButton.trailingAnchor, constant: 113),
            createAccountButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40)

        ])
    }
}

    
//    private func configureRadioButton() -> UIButton {
//        let button = UIButton(type: .custom)
//        button.backgroundColor = .clear
//        button.setImage(UIImage(named: "RadioBtnUnChecked"), for: .normal)
//        button.setImage(UIImage(named: "RadioBtnChecked"), for: .selected)
//        button.imageView?.contentMode = .scaleAspectFit
//        button.contentHorizontalAlignment = .center
//        return button
//    }
    
    //
    //    // MARK: 라디오 버튼
    //    // 약관 전체 동의 버튼
    //    lazy var allTermAgreeBtn: UIButton = {
//            let button = UIButton(type: .custom)
//            button.backgroundColor = .clear
//            button.setImage(unCheckedImg, for: .normal)
//            button.imageView?.contentMode = .scaleAspectFit
//            button.contentHorizontalAlignment = .center
//            return button
    //    }()
    //
    //    // 개인정보 수집 동의 버튼
    //    lazy var privacyAgreeBtn: UIButton = {
    //        let button = UIButton(type: .custom)
    //        button.backgroundColor = .clear
    //        button.setImage(unCheckedImg, for: .normal)
    //        button.imageView?.contentMode = .scaleAspectFit
    //        button.contentHorizontalAlignment = .center
    //        return button
    //    }()
    //
    //    // 이용 약관 동의 버튼
    //    lazy var termOfUseAgreeBtn: UIButton = {
    //        let button = UIButton(type: .custom)
    //        button.backgroundColor = .clear
    //        button.setImage(unCheckedImg, for: .normal)
    //        button.imageView?.contentMode = .scaleAspectFit
    //        button.contentHorizontalAlignment = .center
    //        return button
    //    }()
    //
    //    // 마케팅 활용 동의 버튼
    //    lazy var marketingAgreeBtn: UIButton = {
    //        let button = UIButton(type: .custom)
    //        button.backgroundColor = .clear
    //        button.setImage(unCheckedImg, for: .normal)
    //        button.imageView?.contentMode = .scaleAspectFit
    //        button.contentHorizontalAlignment = .center
    //        return button
    //    }()
    //
    //    // MARK: 동의 레이블
    //    private var allTermAgreeLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "약관 전체 동의"
    //        label.font = UIFont(name: "Pretendard-Regular", size: 16)
    //        label.textAlignment = .left
    //        label.adjustsFontSizeToFitWidth = true
    //        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
    //        return label
    //    }()
    //
    //    private var privacyAgreeLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "(필수) 개인정보 수집 및 이용동의"
    //        label.font = UIFont(name: "Pretendard-Regular", size: 16)
    //        label.textAlignment = .left
    //        label.adjustsFontSizeToFitWidth = true
    //        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
    //        return label
    //    }()
    //
    //    private var termOfUseAgreeLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "(필수) 이용 약관 동의"
    //        label.font = UIFont(name: "Pretendard-Regular", size: 16)
    //        label.textAlignment = .left
    //        label.adjustsFontSizeToFitWidth = true
    //        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
    //        return label
    //    }()
    //
    //    private var marketingAgreeLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "(선택) 마케팅 활용 동의"
    //        label.font = UIFont(name: "Pretendard-Regular", size: 16)
    //        label.textAlignment = .left
    //        label.adjustsFontSizeToFitWidth = true
    //        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
    //        return label
    //    }()
    //
    //    // MARK: 약관 명세 버튼
    //    // 개인정보 수집 및 이용동의 화살표 버튼
    //    lazy var privacyDescriptionBtn: UIButton = {
    //        let button = UIButton(type: .system)
    //        let symbolImage = UIImage(systemName: "chevron.right")
    //        button.setImage(symbolImage, for: .normal)
    //        button.contentMode = .center
    //        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
    //        return button
    //    }()
    //
    //    // 개인정보 수집 및 이용동의 화살표 버튼
    //    lazy var termOfUseDescriptionBtn: UIButton = {
    //        let button = UIButton(type: .system)
    //        let symbolImage = UIImage(systemName: "chevron.right")
    //        button.setImage(symbolImage, for: .normal)
    //        button.contentMode = .center
    //        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
    //        return button
    //    }()
    //
    //    // 개인정보 수집 및 이용동의 화살표 버튼
    //    lazy var marketingDescriptionBtn: UIButton = {
    //        let button = UIButton(type: .system)
    //        let symbolImage = UIImage(systemName: "chevron.right")
    //        button.setImage(symbolImage, for: .normal)
    //        button.contentMode = .center
    //        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
    //        return button
    //    }()
    //
    //// MARK: 스택뷰
    //    // 약관 전체 동의 버튼 + 레이블 스택뷰
    //    private lazy var allTermAgreeStackView: UIStackView = {
    //        let stView = UIStackView(arrangedSubviews: [allTermAgreeBtn, allTermAgreeLabel])
    //        stView.spacing = 9
    //        stView.axis = .horizontal
    //        stView.distribution = .fill
    //        stView.alignment = .fill
    //        return stView
    //    }()
    //
    //    // 개인정보 수집 및 이용 동의 버튼 + 레이블 스택뷰
    //    private lazy var privacyAgreeStackView: UIStackView = {
    //        let stView = UIStackView(arrangedSubviews: [privacyAgreeBtn, privacyAgreeLabel, privacyDescriptionBtn])
    //        stView.spacing = 9
    //        stView.axis = .horizontal
    //        stView.distribution = .fill
    //        stView.alignment = .center
    //        stView.setCustomSpacing(71, after: privacyAgreeLabel)
    //        return stView
    //    }()
    //
    //
    //    // 이용 약관 동의 버튼 + 레이블 스택뷰
    //    private lazy var termOfUseAgreeStackView: UIStackView = {
    //        let stView = UIStackView(arrangedSubviews: [termOfUseAgreeBtn, termOfUseAgreeLabel, termOfUseDescriptionBtn])
    //        stView.spacing = 9
    //        stView.axis = .horizontal
    //        stView.distribution = .fill
    //        stView.alignment = .center
    //        stView.setCustomSpacing(144, after: termOfUseAgreeLabel)
    //        return stView
    //    }()
    //
    //    // 마케팅 전체 동의 버튼 + 레이블 스택뷰
    //    private lazy var marketingAgreeStackView: UIStackView = {
    //        let stView = UIStackView(arrangedSubviews: [marketingAgreeBtn, marketingAgreeLabel, marketingDescriptionBtn])
    //        stView.spacing = 9
    //        stView.axis = .horizontal
    //        stView.distribution = .fill
    //        stView.alignment = .center
    //        stView.setCustomSpacing(130, after: marketingAgreeLabel)
    //        return stView
    //    }()
    //
    //    // 약관동의 스택뷰
    //    private lazy var lineBelowAgreeStackView: UIStackView = {
    //        let stView = UIStackView(arrangedSubviews: [allTermAgreeStackView, lineView, privacyAgreeStackView, termOfUseAgreeStackView, marketingAgreeStackView])
    //        stView.spacing = 16
    //        stView.axis = .vertical
    //        stView.distribution = .fill
    //        stView.alignment = .leading
    //        return stView
    //    }()
    //
    //    // 약관동의 사이 선
    //    private lazy var lineView: UIView = {
    //        let line = UIView()
    //        line.backgroundColor = #colorLiteral(red: 0.7686274648, green: 0.7686274648, blue: 0.7686274648, alpha: 1)
    //        return line
    //    }()

