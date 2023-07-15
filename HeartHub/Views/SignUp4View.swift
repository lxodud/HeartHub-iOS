//
//  SignUp4View.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit

class SignUp4View: UIView {
    
    // MARK: 하트이미지
    
    // 하트이미지 배경
    private lazy var heartImgBackgroundView: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartBackgorund.png")
        return img
    }()
    
    // 하트이미지 1/3
    private lazy var heartImg3View: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartIcon3:3.png")
        img.addSubview(heartImgBackgroundView)
        
        return img
    }()
    
    // 다음화면 넘어가는 버튼
    lazy var nextBtn: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfiguration = UIImage.SymbolConfiguration(weight: .thin)
        let symbolImage = UIImage(systemName: "arrow.right.circle", withConfiguration: symbolConfiguration)
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = .black
        return button
    }()
    
    // MARK: 회원가입화면2 상단 레이블
    // 사랑을 시작해볼까요 레이블
    private var startLabel: UILabel = {
        let label = UILabel()
        label.text = "사랑을 시작해볼까요?"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 계정을 생성하여 즐겨보아요 레이블
    private var startExplainLabel: UILabel = {
        let label = UILabel()
        label.text = "계정을 생성하여 HeartHub를 즐겨보아요."
        label.font = UIFont.systemFont(ofSize: 14)
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
    
    // MARK: 약관동의 + 동의 버튼
    let labelWidth: CGFloat = 200
    //    let spacingAgreeStview: CGFloat = 27
    
    // 약관 전체 동의 레이블
    private var allTermAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "약관 전체 동의"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 약관 전체 동의 버튼
    lazy var allTermAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    // 약관 전체 동의 버튼 + 약관 전체 동의 레이블 스택뷰
    private lazy var allTermAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [allTermAgreeBtn, allTermAgreeLabel])
        stView.spacing = 1
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    
    // 개인정보 수집 동의 레이블
    private var privacyAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "(필수) 개인정보 수집 및 이용동의"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        // label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 개인정보 수집 동의 버튼
    lazy var privacyAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    // 개인정보 수집 및 이용동의 화살표 버튼
    lazy var privacyArrowBtn: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfiguration = UIImage.SymbolConfiguration(weight: .thin)
        let symbolImage = UIImage(systemName: "chevron.right", withConfiguration: symbolConfiguration)
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
        return button
    }()
    
    
    // 개인정보 수집 동의 버튼 + 개인정보 수집 동의 레이블 스택뷰
    private lazy var privacyAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [privacyAgreeBtn, privacyAgreeLabel])
        stView.spacing = 1
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // 이용 약관 동의 레이블
    private var termOfUseAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "(필수) 이용 약관 동의"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        // label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 이용 약관 동의 버튼
    lazy var termOfUseAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        
        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    // 개인정보 수집 및 이용동의 화살표 버튼
    lazy var termOfUseArrowBtn: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfiguration = UIImage.SymbolConfiguration(weight: .thin)
        let symbolImage = UIImage(systemName: "chevron.right", withConfiguration: symbolConfiguration)
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = #colorLiteral(red: 0.06666665524, green: 0.06666665524, blue: 0.06666665524, alpha: 1)
        return button
    }()
    
    
    // 이용 약관 동의 버튼 + 이용 약관 동의 레이블 스택뷰
    private lazy var termOfUseAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [termOfUseAgreeBtn, termOfUseAgreeLabel])
        stView.spacing = 1
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // 마케팅 활용 동의 레이블
    private var marketingAgreeLabel: UILabel = {
        let label = UILabel()
        label.text = "(선택) 마케팅 활용 동의"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        // label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 마케팅 활용 동의 버튼
    lazy var marketingAgreeBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        
        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    // 마케팅 전체 동의 버튼 + 마케팅 전체 동의 레이블 스택뷰
    private lazy var marketingAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [marketingAgreeBtn, marketingAgreeLabel])
        stView.spacing = 1
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // 약관동의레이블 스택뷰
    private lazy var lineBelowAgreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [privacyAgreeStackView, termOfUseAgreeStackView, marketingAgreeStackView])
        stView.spacing = 0
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .leading
        return stView
    }()
    
    // 약관동의레이블 스택뷰
    private lazy var agreeStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [allTermAgreeStackView, lineView, lineBelowAgreeStackView])
        stView.spacing = 7.74
        stView.axis = .vertical
        stView.distribution = .fill
        stView.alignment = .leading
        //        stView.setCustomSpacing(<#T##spacing: CGFloat##CGFloat#>, after: <#T##UIView#>)
        //        stView.layoutMargins = uied
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
        [heartImgBackgroundView,
         heartImg3View,
         nextBtn,
         startLabelStackView,
         agreeStackView].forEach { addSubview($0)}
    }
    
    func setup() {
        backgroundColor = .white


    }
    
    // MARK: 제약
    private func constraints() {
        heartImg3ViewConstraints()
        heartImgBackgroundViewConstraints()
        nextBtnConstraints()
        startLabelStackViewConstraints()
        lineViewConstraints()
        agreeStackViewConstraints()
    }
    
    private func heartImg3ViewConstraints() {
        heartImg3View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImg3View.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            heartImg3View.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 172),
            heartImg3View.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -172)
        ])
    }
    
    private func heartImgBackgroundViewConstraints() {
        heartImgBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImgBackgroundView.topAnchor.constraint(equalTo: heartImg3View.topAnchor, constant: 3),
            heartImgBackgroundView.bottomAnchor.constraint(equalTo: heartImg3View.bottomAnchor, constant: -2.75),
            heartImgBackgroundView.leadingAnchor.constraint(equalTo: heartImg3View.leadingAnchor, constant: 0),
            heartImgBackgroundView.trailingAnchor.constraint(equalTo: heartImg3View.trailingAnchor, constant: 0)
        ])
    }
    
    private func nextBtnConstraints() {
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextBtn.widthAnchor.constraint(equalToConstant: 50),
            nextBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -56),
            nextBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 315),
            nextBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
        ])
    }
    
    private func startLabelStackViewConstraints() {
        startLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabelStackView.topAnchor.constraint(equalTo: heartImg3View.bottomAnchor, constant: 50),
            startLabelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            startLabelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 76),
        ])
    }
    
    private func lineViewConstraints() {
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: agreeStackView.leadingAnchor, constant: -1),
            lineView.trailingAnchor.constraint(equalTo: agreeStackView.trailingAnchor, constant: 0),
        ])
    }
    
    private func agreeStackViewConstraints() {
        agreeStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            agreeStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 158),
            agreeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            agreeStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
}
