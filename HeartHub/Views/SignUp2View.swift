//
//  SignUpView2.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit

class SignUp2View: UIView {
    
    let textViewHeight: CGFloat = 35
    
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
    private lazy var heartImg1View: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartIcon1:3.png")
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
    
    // MARK: 닉네임 아이디 입력란
    // 닉네임 입력 텍스트 필드
    private lazy var nickNameTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .emailAddress
        tf.placeholder = "닉네임을 입력하세요."
        tf.textAlignment = .left
        return tf
    }()
    
    
    // 닉네임 중복확인 버튼
    lazy var nickNameCheckBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        button.setTitle("중복 확인", for: .normal)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .normal)
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
    
    // 아이디 입력 텍스트필드
    private lazy var idTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .emailAddress
        tf.placeholder = "아이디을 입력하세요."
        tf.textAlignment = .left
        return tf
    }()
    
    
    // 아이디 중복확인 버튼
    lazy var idCheckBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        button.setTitle("중복 확인", for: .normal)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
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
    
    // 닉네임, 이메일 입력 스택뷰
    private lazy var nickNameIdStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [nickNameTextFieldView,idTextFieldView])
        stView.spacing = 28
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    // MARK: 성별 선택
    // 남자 버튼
    lazy var maleBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 18
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        
        // 라디오버튼 구현
        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .left
        button.addSubview(maleLabel)
        return button
    }()
    
    let maleLabel: UILabel = {
        let label = UILabel()
        label.text = "남"
        // 폰트 수정 필요
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        //label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    // 여자 버튼
    lazy var femaleBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 18
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        
        // 라디오버튼 구현
        let checkedImg = UIImage(named: "RadioBtnChecked.png")
        let unCheckedImg = UIImage(named: "RadioBtnUnChecked")
        button.setImage(unCheckedImg, for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .left
        button.addSubview(femaleLabel)
        return button
    }()
    
    private let femaleLabel: UILabel = {
        let label = UILabel()
        label.text = "여"
        // 폰트 수정 필요
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        //label.adjustsFontSizeToFitWidth = true
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
        tf.placeholder = "YYYY"
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
        tf.placeholder = "MM"
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
        tf.placeholder = "DD"
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
    private var birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "생년월일 입력란 입니다."
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    
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
         heartImg1View,
         nextBtn,
         startLabelStackView,
         nickNameIdStackView,
         sexBtnStackView,
         birthdayStackView,
         birthdayLabel].forEach { addSubview($0)}
    }
    
    func setup() {
        backgroundColor = .white
        idTextField.delegate = self
        nickNameTextField.delegate = self
        birthdayYearTextField.delegate = self
        birthdayMonthTextField.delegate = self
        birthdayDateTextField.delegate = self
    }
    

    
    func constraints() {
        heartImg1ViewConstraints()
        heartImgBackgroundViewConstraints()
        nextBtnConstraints()
        startLabelStackViewConstraints()
        nickNameTextFieldViewConstraints()
        nickNameCheckBtnConstraints()
        idTextFieldConstraints()
        idTextFieldViewConstraints()
        idCheckBtnConstraints()
        nickNameIdStackViewConstraints()
        maleLabelConstraints()
        femaleLabelConstraints()
        sexBtnStackViewConstraints()
        birthdayYearTextFieldConstraints()
        birthdayMonthTextFieldConstraints()
        birthdayDateTextFieldConstraints()
        birthdayStackViewConstraints()
        birthdayYearTextFieldViewConstraints()
        birthdayMonthTextFieldViewConstraints()
        birthdayDateTextFieldViewConstraints()
        birthdayLabelConstraints()
    }
    
    private func heartImgBackgroundViewConstraints() {
        heartImgBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImgBackgroundView.topAnchor.constraint(equalTo: heartImg1View.topAnchor, constant: 3),
            heartImgBackgroundView.bottomAnchor.constraint(equalTo: heartImg1View.bottomAnchor, constant: -2.75),
            heartImgBackgroundView.leadingAnchor.constraint(equalTo: heartImg1View.leadingAnchor, constant: 0),
            heartImgBackgroundView.trailingAnchor.constraint(equalTo: heartImg1View.trailingAnchor, constant: 0)
        ])
    }
    
    private func heartImg1ViewConstraints() {
        heartImg1View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImg1View.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            heartImg1View.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 172),
            heartImg1View.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -172)
        ])
    }
    
    private func nextBtnConstraints() {
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextBtn.widthAnchor.constraint(equalToConstant: 50),
            nextBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -56),
            nextBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 315),
            nextBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
    
    private func startLabelStackViewConstraints() {
        startLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabelStackView.topAnchor.constraint(equalTo: heartImg1View.bottomAnchor, constant: 50),
            startLabelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            startLabelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 76)
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

    private func nickNameIdStackViewConstraints() {
        nickNameIdStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nickNameIdStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 134),
            nickNameIdStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            nickNameIdStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    private func maleLabelConstraints() {
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maleLabel.centerYAnchor.constraint(equalTo: maleBtn.centerYAnchor),
            maleLabel.leadingAnchor.constraint(equalTo: maleBtn.leadingAnchor, constant: 41),
            maleLabel.trailingAnchor.constraint(equalTo: maleBtn.trailingAnchor, constant: -14)        ])
    }
    
    private func femaleLabelConstraints() {
        femaleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            femaleLabel.centerYAnchor.constraint(equalTo: femaleBtn.centerYAnchor),
            femaleLabel.leadingAnchor.constraint(equalTo: femaleBtn.leadingAnchor, constant: 41),
            femaleLabel.trailingAnchor.constraint(equalTo: femaleBtn.trailingAnchor, constant: -14)        ])
    }
    
    private func sexBtnStackViewConstraints() {
        sexBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sexBtnStackView.heightAnchor.constraint(equalToConstant: textViewHeight),
            sexBtnStackView.topAnchor.constraint(equalTo: nickNameIdStackView.bottomAnchor, constant: 28),
            //sexBtnStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            sexBtnStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -203)
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
    
    private func birthdayStackViewConstraints() {
        birthdayStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayStackView.topAnchor.constraint(equalTo: maleBtn.bottomAnchor, constant: 22),
            birthdayStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            birthdayStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -67),
            birthdayStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 35)        ])
    }
    
    private func birthdayYearTextFieldViewConstraints() {
        birthdayYearTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayYearTextFieldView.widthAnchor.constraint(equalToConstant: 105)
        ])
    }
    
    private func birthdayMonthTextFieldViewConstraints() {
        birthdayMonthTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayMonthTextFieldView.widthAnchor.constraint(equalToConstant: 86),
        ])
    }
    
    private func birthdayDateTextFieldViewConstraints() {
        birthdayDateTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayDateTextFieldView.widthAnchor.constraint(equalToConstant: 86)
        ])
    }
    
    private func birthdayLabelConstraints() {
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            birthdayLabel.topAnchor.constraint(equalTo: birthdayStackView.bottomAnchor, constant: 2),
            birthdayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 44),
            birthdayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -236)
        ])
    }
}



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
    
    // 텍스트필드 별 글자수 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 백스페이스 감지
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }
        
        switch textField {
        case birthdayYearTextField:
            guard birthdayYearTextField.text!.count < 4 else { return false }
            return true
        case birthdayMonthTextField:
            guard birthdayMonthTextField.text!.count < 2 else { return false }
            return true
        case birthdayDateTextField:
            guard birthdayDateTextField.text!.count < 2 else { return false }
            return true
        default:
            return true
        }

    }
}


