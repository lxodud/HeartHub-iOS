//
//  SignUp4View.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit

class SignUpTermAgreeView: UIView {
    
    let unCheckedImg = UIImage(named: "AgreeRadioBtnUnChecked")
    
    // MARK: 하트이미지
    // 하트이미지 1/3
    private lazy var heartImg3View: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartIcon3:3.png")        
        return img
    }()
    
    // MARK: 이전화면 버튼 다음화면 버튼
    lazy var leftArrowBtn: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = false
        btn.setImage(UIImage(named: "LeftArrow"), for: .normal)
        btn.contentMode = .center
        return btn
    }()
    
    lazy var rightArrowBtn: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = false
        btn.setImage(UIImage(named: "RightArrow"), for: .normal)
        btn.contentMode = .center
        return btn
    }()
    
    private lazy var arrowBtnStackView: UIStackView = {
       let stView = UIStackView(arrangedSubviews: [leftArrowBtn, rightArrowBtn])
        stView.axis = .horizontal
        stView.spacing = 198
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    
    // MARK: 회원가입화면4 상단 레이블
    // 사랑을 시작해볼까요 레이블
    private var startLabel: UILabel = {
        let label = UILabel()
        label.text = "사랑을 시작해볼까요?"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 20)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 계정을 생성하여 즐겨보아요 레이블
    private var startExplainLabel: UILabel = {
        let label = UILabel()
        label.text = "계정을 생성하여 HeartHub를 즐겨보아요."
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    // 두 레이블 묶는 스택뷰
    private lazy var startLabelStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [startLabel, startExplainLabel])
        stView.spacing = 5
        stView.axis = .vertical
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
// MARK: 약관동의
    
    // MARK: 라디오 버튼
    
    // 약관 전체 동의 버튼
    lazy var allTermAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    // 개인정보 수집 동의 버튼
    lazy var privacyAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    // 이용 약관 동의 버튼
    lazy var termOfUseAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    // 마케팅 활용 동의 버튼
    lazy var marketingAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    // MARK: 동의 레이블
    private var allTermAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "약관 전체 동의"
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    private var privacyAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "(필수) 개인정보 수집 및 이용동의"
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    private var termOfUseAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "(필수) 이용 약관 동의"
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    private var marketingAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "(선택) 마케팅 활용 동의"
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // MARK: 약관 명세 버튼
    // 개인정보 수집 및 이용동의 화살표 버튼
    lazy var privacyDescriptionBtn: UIButton = {
        let button = UIButton(type: .system)
        let symbolImage = UIImage(systemName: "chevron.right")
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
        return button
    }()
    
    // 개인정보 수집 및 이용동의 화살표 버튼
    lazy var termOfUseDescriptionBtn: UIButton = {
        let button = UIButton(type: .system)
        let symbolImage = UIImage(systemName: "chevron.right")
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
        return button
    }()
  
    // 개인정보 수집 및 이용동의 화살표 버튼
    lazy var marketingDescriptionBtn: UIButton = {
        let button = UIButton(type: .system)
        let symbolImage = UIImage(systemName: "chevron.right")
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
        return button
    }()
    
// MARK: 스택뷰
    // 약관 전체 동의 버튼 + 레이블 스택뷰
    private lazy var allTermAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [allTermAgreeBtn, allTermAgreeLabel])
        stView.spacing = 9
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()

    // 개인정보 수집 및 이용 동의 버튼 + 레이블 스택뷰
    private lazy var privacyAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [privacyAgreeBtn, privacyAgreeLabel, privacyDescriptionBtn])
        stView.spacing = 9
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .center
        stView.setCustomSpacing(71, after: privacyAgreeLabel)
        return stView
    }()

    
    // 이용 약관 동의 버튼 + 레이블 스택뷰
    private lazy var termOfUseAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [termOfUseAgreeBtn, termOfUseAgreeLabel, termOfUseDescriptionBtn])
        stView.spacing = 9
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .center
        stView.setCustomSpacing(144, after: termOfUseAgreeLabel)
        return stView
    }()

    // 마케팅 전체 동의 버튼 + 레이블 스택뷰
    private lazy var marketingAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [marketingAgreeBtn, marketingAgreeLabel, marketingDescriptionBtn])
        stView.spacing = 9
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .center
        stView.setCustomSpacing(130, after: marketingAgreeLabel)
        return stView
    }()
    
    // 약관동의 스택뷰
    private lazy var lineBelowAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [allTermAgreeStackView, lineView, privacyAgreeStackView, termOfUseAgreeStackView, marketingAgreeStackView])
        stView.spacing = 16
        stView.axis = .vertical
        stView.distribution = .fill
        stView.alignment = .leading
        return stView
    }()
    
    // 약관동의 사이 선
    private lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.7686274648, green: 0.7686274648, blue: 0.7686274648, alpha: 1)
        return line
    }()
    
// MARK: 뷰 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        constraints()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        [heartImg3View,
         arrowBtnStackView,
         startLabelStackView,
         lineBelowAgreeStackView,
        ].forEach { addSubview($0)}
    }
    
    func setup() {
        backgroundColor = .white
    }
    
    // MARK: 제약
    private func constraints() {
        heartImg3ViewConstraints()
        startLabelStackViewConstraints()
        lineViewConstraints()
        lineBelowAgreeStackViewConstraints()
        arrowBtnConstraints()
        privacyArrowBtnConstraints()
    }
    
    private func heartImg3ViewConstraints() {
        heartImg3View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImg3View.heightAnchor.constraint(equalTo: heartImg3View.widthAnchor),
            heartImg3View.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartImg3View.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            heartImg3View.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 172),
        ])
    }
    
    private func startLabelStackViewConstraints() {
        startLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabelStackView.topAnchor.constraint(equalTo: heartImg3View.bottomAnchor, constant: 34),
            startLabelStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            startLabelStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -76),
        ])
    }
    
    private func lineViewConstraints() {
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineView.topAnchor.constraint(equalTo: allTermAgreeStackView.bottomAnchor, constant: 16),
            lineView.bottomAnchor.constraint(equalTo: privacyAgreeStackView.topAnchor, constant: -16),
            lineView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
        ])
    }
    
    private func lineBelowAgreeStackViewConstraints() {
        lineBelowAgreeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineBelowAgreeStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineBelowAgreeStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 170),
            lineBelowAgreeStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 33)
        ])
    }
    
    private func arrowBtnConstraints() {
        arrowBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightArrowBtn.heightAnchor.constraint(equalTo: rightArrowBtn.widthAnchor),
            leftArrowBtn.heightAnchor.constraint(equalTo: leftArrowBtn.widthAnchor),
            arrowBtnStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -33),
            arrowBtnStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            arrowBtnStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }

    private func privacyArrowBtnConstraints() {
        privacyDescriptionBtn.translatesAutoresizingMaskIntoConstraints = false
        termOfUseDescriptionBtn.translatesAutoresizingMaskIntoConstraints = false
        marketingDescriptionBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            privacyDescriptionBtn.heightAnchor.constraint(equalToConstant: 14),
            privacyDescriptionBtn.widthAnchor.constraint(equalTo: privacyDescriptionBtn.heightAnchor),
            
            termOfUseDescriptionBtn.heightAnchor.constraint(equalTo: privacyDescriptionBtn.heightAnchor),
            termOfUseDescriptionBtn.widthAnchor.constraint(equalTo: privacyDescriptionBtn.heightAnchor),
            
            marketingDescriptionBtn.heightAnchor.constraint(equalTo: privacyDescriptionBtn.heightAnchor),
            marketingDescriptionBtn.widthAnchor.constraint(equalTo: privacyDescriptionBtn.heightAnchor),
        ])
    }
}
