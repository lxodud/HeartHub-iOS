//
//  SignUpView2.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit
import DLRadioButton

class SignUp2View: UIView {
    let textViewHeight: CGFloat = 35
    
// MARK: 하트이미지
    // 하트이미지 1/3
    private lazy var heartImg1View: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartIcon1:3.png")
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
    
    // MARK: 회원가입화면2 상단 레이블
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
        stView.spacing = 3.5
        stView.axis = .vertical
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // MARK: 닉네임 아이디 입력란
    // 닉네임 입력 텍스트 필드
    private lazy var nickNameTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        tf.attributedPlaceholder = NSAttributedString(
                        string: "닉네임을 입력하세요.",
                        attributes: [
                            NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5),
                            NSAttributedString.Key.font:
                                UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .left
        return tf
    }()
    
    
    // 닉네임 중복확인 버튼
    lazy var nickNameCheckBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        button.setTitle("중복 확인", for: .normal)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.contentMode = .center
        button.tintColor = .black
        return button
    }()
    
    // 닉네임 입력 뷰
    private lazy var nickNameTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(nickNameTextField)
        view.addSubview(nickNameCheckBtn)
        
        return view
    }()
    
    // 닉네임 제약
    private lazy var nickNameDescriptionLabel: UILabel = {
        var label = UILabel()
        label.text = "한글/영문/숫자/특수문자 구성"
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    
    // 아이디 입력 텍스트필드
    private lazy var idTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        tf.attributedPlaceholder = NSAttributedString(
                        string: "아이디를 입력하세요.",
                        attributes: [
                            NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5),
                            NSAttributedString.Key.font:
                                UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .left
        return tf
    }()
    
    
    // 아이디 중복확인 버튼
    lazy var idCheckBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        button.setTitle("중복 확인", for: .normal)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
        button.titleLabel?.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.contentMode = .center
        button.tintColor = .black
        return button
    }()
    
    // 아이디 입력 뷰
    private lazy var idTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(idTextField)
        view.addSubview(idCheckBtn)
        
        return view
    }()
    
    // 아이디 제약
    private lazy var idDescriptionLabel: UILabel = {
        var label = UILabel()
        label.text = "영문/숫자 구성"
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    // 비밀번호 입력 텍스트필드
    private lazy var pwTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.attributedPlaceholder = NSAttributedString(
                        string: "비밀번호를 입력하세요.",
                        attributes: [
                            NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5),
                            NSAttributedString.Key.font:
                                UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .left
        return tf
    }()
    
    
    // 비밀번호 중복확인 버튼
    lazy var pwCheckBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        button.setTitle("중복 확인", for: .normal)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 14)
        button.titleLabel?.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.contentMode = .center
        button.tintColor = .black
        return button
    }()
    
    // 비밀번호 입력 뷰
    private lazy var pwTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(pwTextField)
        return view
    }()
    
    // 비밀번호 제약 레이블
    private lazy var pwDescriptionLabel: UILabel = {
        var label = UILabel()
        label.text = "영문/숫자/특수문자 구성"
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    
    // 닉네임, 이메일, 비밀번호 입력 스택뷰
    private lazy var enterStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [nickNameTextFieldView, idTextFieldView, pwTextFieldView])
        stView.spacing = 30
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    // MARK: 성별 선택
    // 남자 버튼
    lazy var maleBtn: UIButton = {
        var btn = UIButton(type: .custom)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 18
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        
        // 라디오버튼 구현
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        btn.setImage(unCheckedImg, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
//        btn.adjustsImageSizeForAccessibilityContentSizeCategory = true
        btn.contentHorizontalAlignment = .leading
        btn.addSubview(maleLabel)
        return btn
    }()
    
    let maleLabel: UILabel = {
        let label = UILabel()
        label.text = "남"
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textAlignment = .center
//        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()

    // 여자 버튼
    lazy var femaleBtn: UIButton = {
        var btn = UIButton(type: .custom)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 18
        btn.layer.borderWidth = 1
        btn.layer.borderColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)        
        
        // 라디오버튼 구현
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        btn.setImage(unCheckedImg, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
//        btn.adjustsImageSizeForAccessibilityContentSizeCategory = true
        btn.contentHorizontalAlignment = .leading
        btn.addSubview(femaleLabel)
        return btn
    }()
    
    private let femaleLabel: UILabel = {
        let label = UILabel()
        label.text = "여"
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textAlignment = .center
//        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    // 남녀 버튼 스택뷰
    private lazy var sexBtnStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [maleBtn, femaleBtn])
        stView.spacing = 19
        stView.axis = .horizontal
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    // MARK: 생년월일
    // 생년 텍스트 필드
    private lazy var birthdayYearTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .numberPad
        tf.attributedPlaceholder = NSAttributedString(
                        string: "YYYY",
                        attributes: [
                            NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5),
                            NSAttributedString.Key.font:
                                UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .center
        return tf
    }()
    
    // 생년 뷰
    private lazy var birthdayYearTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(birthdayYearTextField)
        return view
    }()
    
    // 생월 텍스트 필드
    private lazy var birthdayMonthTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .numberPad
        tf.attributedPlaceholder = NSAttributedString(
                        string: "MM",
                        attributes: [
                            NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5),
                            NSAttributedString.Key.font:
                                UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .center
        return tf
    }()
    
    // 생월 뷰
    private lazy var birthdayMonthTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(birthdayMonthTextField)
        return view
    }()
    
    // 생일 텍스트 필드
    private lazy var birthdayDateTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .numberPad
        tf.attributedPlaceholder = NSAttributedString(
                        string: "DD",
                        attributes: [
                            NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5),
                            NSAttributedString.Key.font:
                                UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .center
        return tf
    }()
    
    // 생일 뷰
    private lazy var birthdayDateTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(birthdayDateTextField)
        return view
    }()
    
    // 생년월일 스택뷰
    private lazy var birthdayStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [birthdayYearTextFieldView, birthdayMonthTextFieldView, birthdayDateTextFieldView])
        stView.spacing = 7
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // 생년월일 입력란 입니다.
    private var birthdayDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "생년월일 입력란 입니다."
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
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
        [heartImg1View,
         arrowBtnStackView,
         startLabelStackView,
         
         nickNameDescriptionLabel,
         idDescriptionLabel,
         pwDescriptionLabel,
         
         enterStackView,
         sexBtnStackView,
         birthdayStackView,
         birthdayDescriptionLabel].forEach { addSubview($0)}
    }
    
    func setup() {
        backgroundColor = .white
        idTextField.delegate = self
        nickNameTextField.delegate = self
        pwTextField.delegate = self
        birthdayYearTextField.delegate = self
        birthdayMonthTextField.delegate = self
        birthdayDateTextField.delegate = self
    }
    
    // MARK: 제약
    
    func constraints() {
        heartImg1ViewConstraints()
        arrowBtnConstraints()
        startLabelStackViewConstraints()
        
        nickNameDescriptionLabelConstraints()
        idDescriptionLabelConstraints()
        pwDescriptionLabelConstraints()
        
        nickNameTextFieldConstraints()
        nickNameTextFieldViewConstraints()
        nickNameCheckBtnConstraints()
        
        idTextFieldConstraints()
        idTextFieldViewConstraints()
        idCheckBtnConstraints()
        
        pwTextFieldConstraints()
        pwTextFieldViewConstraints()
        enterStackViewConstraints()
        
        maleLabelConstraints()
        femaleLabelConstraints()
        sexBtnStackViewConstraints()
        
        birthdayYearTextFieldConstraints()
        birthdayMonthTextFieldConstraints()
        birthdayDateTextFieldConstraints()
        birthdayStackViewConstraints()
        birthdayMonthTextFieldViewConstraints()
        birthdayDateTextFieldViewConstraints()
        birthdayDescriptionConstraints()
    }
    
    private func heartImg1ViewConstraints() {
        heartImg1View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImg1View.heightAnchor.constraint(equalTo: heartImg1View.widthAnchor),
            heartImg1View.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartImg1View.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            heartImg1View.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 172),
        ])
    }

    
    private func startLabelStackViewConstraints() {
        startLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabelStackView.topAnchor.constraint(equalTo: heartImg1View.bottomAnchor, constant: 34),
            startLabelStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            startLabelStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -120)
        ])
    }
    
    private func enterStackViewConstraints() {
        enterStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 104),
            enterStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            enterStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    private func sexBtnStackViewConstraints() {
        sexBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sexBtnStackView.heightAnchor.constraint(equalToConstant: textViewHeight),
            sexBtnStackView.topAnchor.constraint(equalTo: pwDescriptionLabel.bottomAnchor, constant: 15),
            sexBtnStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            sexBtnStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -203)
        ])
    }
    
    private func birthdayStackViewConstraints() {
        birthdayStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayStackView.topAnchor.constraint(equalTo: maleBtn.bottomAnchor, constant: 22),
            birthdayStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            birthdayStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -67),
            birthdayStackView.heightAnchor.constraint(equalTo: nickNameTextFieldView.heightAnchor)
        ])
    }
    
    private func arrowBtnConstraints() {
        arrowBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightArrowBtn.heightAnchor.constraint(equalTo: rightArrowBtn.widthAnchor),
            leftArrowBtn.heightAnchor.constraint(equalTo: leftArrowBtn.widthAnchor),
            arrowBtnStackView.topAnchor.constraint(equalTo: birthdayDescriptionLabel.bottomAnchor, constant: 118),
            arrowBtnStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -33),
            arrowBtnStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            arrowBtnStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
    
    private func nickNameDescriptionLabelConstraints() {
        nickNameDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nickNameDescriptionLabel.topAnchor.constraint(equalTo: nickNameTextFieldView.bottomAnchor, constant: 3),
            nickNameDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 44),
            nickNameDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 211),
        ])
    }
    
    private func idDescriptionLabelConstraints() {
        idDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idDescriptionLabel.topAnchor.constraint(equalTo: idTextFieldView.bottomAnchor, constant: 3),
            idDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 44),
            idDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 211),
        ])
    }
    
    private func pwDescriptionLabelConstraints() {
        pwDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwDescriptionLabel.topAnchor.constraint(equalTo: pwTextFieldView.bottomAnchor, constant: 3),
            pwDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 44),
            nickNameDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 211),
        ])
    }
            
    
    private func nickNameTextFieldConstraints() {
        nickNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nickNameTextField.topAnchor.constraint(equalTo: nickNameTextFieldView.topAnchor),
            nickNameTextField.bottomAnchor.constraint(equalTo: nickNameTextFieldView.bottomAnchor),
            nickNameTextField.leadingAnchor.constraint(equalTo: nickNameTextFieldView.leadingAnchor, constant: 27),
            nickNameTextField.trailingAnchor.constraint(equalTo: nickNameCheckBtn.leadingAnchor, constant: 73)
        ])
    }
    
    private func nickNameTextFieldViewConstraints() {
        nickNameTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nickNameTextFieldView.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    private func nickNameCheckBtnConstraints() {
        nickNameCheckBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nickNameCheckBtn.topAnchor.constraint(equalTo: nickNameTextFieldView.topAnchor),
            nickNameCheckBtn.bottomAnchor.constraint(equalTo: nickNameTextFieldView.bottomAnchor),
            nickNameCheckBtn.leadingAnchor.constraint(equalTo: nickNameTextFieldView.leadingAnchor, constant: 255.22),
            nickNameCheckBtn.trailingAnchor.constraint(equalTo: nickNameTextFieldView.trailingAnchor)
        ])
    }
    
    private func idTextFieldConstraints() {
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: idTextFieldView.topAnchor),
            idTextField.bottomAnchor.constraint(equalTo: idTextFieldView.bottomAnchor),
            idTextField.leadingAnchor.constraint(equalTo: idTextFieldView.leadingAnchor, constant: 27),
            idTextField.trailingAnchor.constraint(equalTo: idCheckBtn.leadingAnchor)
        ])
    }
    
    private func idTextFieldViewConstraints() {
        idTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idTextFieldView.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    private func idCheckBtnConstraints() {
        idCheckBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idCheckBtn.topAnchor.constraint(equalTo: idTextFieldView.topAnchor),
            idCheckBtn.bottomAnchor.constraint(equalTo: idTextFieldView.bottomAnchor),
            idCheckBtn.leadingAnchor.constraint(equalTo: idTextFieldView.leadingAnchor, constant: 255.22),
            idCheckBtn.trailingAnchor.constraint(equalTo: idTextFieldView.trailingAnchor)
        ])
    }

    
    private func pwTextFieldConstraints() {
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwTextField.topAnchor.constraint(equalTo: pwTextFieldView.topAnchor),
            pwTextField.bottomAnchor.constraint(equalTo: pwTextFieldView.bottomAnchor),
            pwTextField.leadingAnchor.constraint(equalTo: pwTextFieldView.leadingAnchor, constant: 27),
            pwTextField.trailingAnchor.constraint(equalTo: pwTextFieldView.trailingAnchor, constant: 27)
        ])
    }
    
    private func pwTextFieldViewConstraints() {
        pwTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pwTextFieldView.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    private func maleLabelConstraints() {
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maleLabel.centerYAnchor.constraint(equalTo: maleBtn.centerYAnchor),
            maleLabel.leadingAnchor.constraint(equalTo: maleBtn.leadingAnchor, constant: 41),
            maleLabel.trailingAnchor.constraint(equalTo: maleBtn.trailingAnchor, constant: -14)
        ])
    }

    private func femaleLabelConstraints() {
        femaleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            femaleLabel.centerYAnchor.constraint(equalTo: femaleBtn.centerYAnchor),
            femaleLabel.leadingAnchor.constraint(equalTo: femaleBtn.leadingAnchor, constant: 41),
            femaleLabel.trailingAnchor.constraint(equalTo: femaleBtn.trailingAnchor, constant: -14)
        ])
    }
    
    private func birthdayYearTextFieldConstraints() {
        birthdayYearTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayYearTextField.topAnchor.constraint(equalTo: birthdayYearTextFieldView.topAnchor),
            birthdayYearTextField.bottomAnchor.constraint(equalTo: birthdayYearTextFieldView .bottomAnchor),
            birthdayYearTextField.leadingAnchor.constraint(equalTo: birthdayYearTextFieldView.leadingAnchor, constant: 22),
            birthdayYearTextField.trailingAnchor.constraint(equalTo: birthdayYearTextFieldView.trailingAnchor, constant: -22)
        ])
    }
    
    private func birthdayMonthTextFieldConstraints() {
        birthdayMonthTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayMonthTextField.topAnchor.constraint(equalTo: birthdayMonthTextFieldView.topAnchor),
            birthdayMonthTextField.bottomAnchor.constraint(equalTo: birthdayMonthTextFieldView.bottomAnchor),
            birthdayMonthTextField.leadingAnchor.constraint(equalTo: birthdayMonthTextFieldView.leadingAnchor, constant: 22),
            birthdayMonthTextField.trailingAnchor.constraint(equalTo: birthdayMonthTextFieldView.trailingAnchor, constant: -22)        ])
    }
    
    private func birthdayDateTextFieldConstraints() {
        birthdayDateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayDateTextField.topAnchor.constraint(equalTo: birthdayDateTextFieldView.topAnchor),
            birthdayDateTextField.bottomAnchor.constraint(equalTo: birthdayDateTextFieldView.bottomAnchor),
            birthdayDateTextField.leadingAnchor.constraint(equalTo: birthdayDateTextFieldView.leadingAnchor, constant: 22),
            birthdayDateTextField.trailingAnchor.constraint(equalTo: birthdayDateTextFieldView.trailingAnchor, constant: -22)
        ])
    }
    
    private func birthdayMonthTextFieldViewConstraints() {
        birthdayMonthTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        birthdayMonthTextFieldView.widthAnchor.constraint(equalTo: birthdayYearTextFieldView.widthAnchor, multiplier: 0.81 ).isActive = true

    }
    
    private func birthdayDateTextFieldViewConstraints() {
        birthdayDateTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        birthdayDateTextFieldView.widthAnchor.constraint(equalTo: birthdayMonthTextFieldView.widthAnchor).isActive = true
    }
    
    private func birthdayDescriptionConstraints() {
        birthdayDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayDescriptionLabel.topAnchor.constraint(equalTo: birthdayStackView.bottomAnchor, constant: 2),
            birthdayDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 44),
            birthdayDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -236)
        ])
    }
}

// MARK: 텍스트필드 델리게이트

extension SignUp2View: UITextFieldDelegate {
    
    // 키보드 엔터키가 눌렸을때 (다음 동작을 허락할 것인지)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if idTextField.text != "", nickNameTextField.text != "" {
            idTextField.resignFirstResponder()
            return true
            // 두번째 텍스트필드로 넘어가도록
        } else if nickNameTextField.text != "" {
            idTextField.becomeFirstResponder()
            return true
        }
        
        if birthdayYearTextField.text != "", birthdayMonthTextField.text != "", birthdayDateTextField.text != "" {
            birthdayDateTextField.resignFirstResponder()
            return true
        } else if birthdayYearTextField.text != "", birthdayMonthTextField.text != "" {
            birthdayDateTextField.becomeFirstResponder()
            return true
        } else if birthdayYearTextField.text != "" {
            birthdayMonthTextField.becomeFirstResponder()
            return true
        }
            return false
        }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        idTextField.resignFirstResponder()
        nickNameTextField.resignFirstResponder()
        birthdayYearTextField.resignFirstResponder()
        birthdayMonthTextField.resignFirstResponder()
        birthdayDateTextField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        // 백스페이스 감지
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        
        guard let text = textField.text else {
            return true
        }
        
        let maxLength: Int
        var allowedCharacterSet: CharacterSet
        
        switch textField {
        case nickNameTextField:
            maxLength = 10
            allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_?+=~")
                .union(CharacterSet(charactersIn: "\u{AC00}"..."\u{D7A3}"))
                .union(CharacterSet(charactersIn: "\u{3131}"..."\u{314E}"))
                .union(CharacterSet(charactersIn: "\u{314F}"..."\u{3163}"))
        case idTextField:
            maxLength = 18
            allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        case pwTextField:
            maxLength = 15
            allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_?+=~")
        case birthdayYearTextField:
            maxLength = 4
            allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
            let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
            let currentYear = Calendar.current.component(.year, from: Date())
            if let year = Int(updatedText) {
                     if year >= 1950 && year <= currentYear {
                         return true
                     }
                 }
        case birthdayMonthTextField:
            maxLength = 2
            allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
            let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
            if let month = Int(updatedText) {
                     if month >= 01 && month <= 12 {
                         return true
                     }
                 }
        case birthdayDateTextField:
            maxLength = 2
            allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
            let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
            if let date = Int(updatedText) {
                     if date >= 01 && date <= 31 {
                         return true
                     }
                 }
        default:
            return true
        }
        
        let newLength = text.count + string.count - range.length
        
        if newLength <= maxLength {
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacterSet.isSuperset(of: characterSet)
        } else {
            return false
        }
    }
    

}


