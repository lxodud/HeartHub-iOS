//
//  SignUp3View.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit

class SignUp3View: UIView {
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
    private lazy var heartImg2View: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartIcon2:3.png")
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
    
    // MARK: 이메일 인증번호 입력란
    // 이메일 입력 텍스트 필드
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .emailAddress
        tf.placeholder = "이메일을 입력하세요."
        tf.textAlignment = .left
        return tf
    }()
    
    
    // 이메일 인증 버튼
    lazy var emailCertifyBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        button.setTitle("인증", for: .normal)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.contentMode = .center
        button.tintColor = .black
        return button
    }()
    
    // 이메일 입력 뷰
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(emailTextField)
        view.addSubview(emailCertifyBtn)

       return view
    }()
    
    // 인증번호 입력 텍스트필드
    private lazy var certificationNumberTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .phonePad
        tf.placeholder = "인증번호를 입력해주세요."
        tf.textAlignment = .left
        return tf
    }()
    
    
    // 인증번호 인증 버튼
    lazy var certificationNumCertifyBtn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.8588235378, green: 0.8588235378, blue: 0.8588235378, alpha: 1)
        button.setTitle("인증", for: .normal)
        button.setTitleColor(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.contentMode = .center
        button.tintColor = .black
        return button
    }()
    
    // 인증번호 입력 뷰
    private lazy var certificationTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(certificationNumberTextField)
        view.addSubview(certificationNumCertifyBtn)

       return view
    }()
    
    // 닉네임, 이메일 입력 스택뷰
    private lazy var certificationStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [emailTextFieldView,certificationTextFieldView])
        stView.spacing = 28
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    // 연인 닉네임 또는 아이디 입력 텍스트필드
    private lazy var loverIdTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .emailAddress
        tf.placeholder = "(선택) 내 애인의 닉네임 또는 아이디를 입력하세요."
        tf.textAlignment = .left
        return tf
    }()
    
    // 연인 닉네임 또는 아이디 입력 텍스트필드 뷰
    private lazy var loverIdTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(loverIdTextField)
       return view
    }()
    
    // 아이디로 계정연동 레이블
    private var idLinkingLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디로 계정연동"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    // 연인 계정 연동 스택뷰
    private lazy var loverLinkingStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [loverIdTextFieldView, idLinkingLabel])
        stView.spacing = 4
        stView.axis = .vertical
        stView.distribution = .fill
        stView.alignment = .trailing
        return stView
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
        heartImg2View,
        nextBtn,
        startLabelStackView,
        certificationStackView,
        loverLinkingStackView].forEach { addSubview($0)}
    }
    
    func setup() {
        backgroundColor = .white

        emailTextField.delegate = self
        certificationNumberTextField.delegate = self
        loverIdTextField.delegate = self
    }
    
    
    private func constraints() {
        heartImg2ViewConstraints()
        heartImgBackgroundViewConstraints()
        nextBtnConstraints()
        startLabelStackViewConstraints()
        emailTextFieldViewConstraints()
        emailTextFieldConstraints()
        emailCheckBtnConstraints()
        certificationTextFieldViewConstraints()
        certificationNumberTextFieldConstraints()
        certificationNumberBtnConstraints()
        certificationStackViewConstraints()
        loverIdTextFieldConstraints()
        loverIdTextFieldViewConstraints()
        idLinkingLabelConstraints()
    }
    
    private func heartImg2ViewConstraints() {
        heartImg2View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        heartImg2View.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
        heartImg2View.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 172),
        heartImg2View.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -172)
        ])
    }
    
    private func heartImgBackgroundViewConstraints() {
        heartImgBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        heartImgBackgroundView.topAnchor.constraint(equalTo: heartImg2View.topAnchor, constant: 3),
        heartImgBackgroundView.bottomAnchor.constraint(equalTo: heartImg2View.bottomAnchor, constant: -2.75 ),
        heartImgBackgroundView.leadingAnchor.constraint(equalTo: heartImg2View.leadingAnchor, constant: 0),
        heartImgBackgroundView.trailingAnchor.constraint(equalTo: heartImg2View.trailingAnchor, constant: 0)
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
        startLabelStackView.topAnchor.constraint(equalTo: heartImg2View.bottomAnchor, constant: 50),
        startLabelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
        startLabelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 76)
        ])
    }
    
    private func emailTextFieldViewConstraints() {
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextFieldView.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    private func emailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor),
        emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor),
        emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 27),
        emailTextField.trailingAnchor.constraint(equalTo: emailCertifyBtn.leadingAnchor, constant: 73)
        ])
        
    }
    
    private func emailCheckBtnConstraints() {
        emailCertifyBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        emailCertifyBtn.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor),
        emailCertifyBtn.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor),
        emailCertifyBtn.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 255.22),
        emailCertifyBtn.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor)
        ])
    }
    
    private func certificationTextFieldViewConstraints() {
        certificationTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        certificationTextFieldView.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])

        
    }
    
    private func certificationNumberTextFieldConstraints() {
        certificationNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        certificationNumberTextField.topAnchor.constraint(equalTo: certificationTextFieldView.topAnchor),
        certificationNumberTextField.bottomAnchor.constraint(equalTo: certificationTextFieldView.bottomAnchor),
        certificationNumberTextField.leadingAnchor.constraint(equalTo: certificationTextFieldView.leadingAnchor, constant: 27),
        certificationNumberTextField.trailingAnchor.constraint(equalTo: certificationNumCertifyBtn.leadingAnchor)
        ])
        
    }
    
    private func certificationNumberBtnConstraints() {
        certificationNumCertifyBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        certificationNumCertifyBtn.topAnchor.constraint(equalTo: certificationTextFieldView.topAnchor),
        certificationNumCertifyBtn.bottomAnchor.constraint(equalTo: certificationTextFieldView.bottomAnchor),
        certificationNumCertifyBtn.leadingAnchor.constraint(equalTo: certificationTextFieldView.leadingAnchor, constant: 255.22),
        certificationNumCertifyBtn.trailingAnchor.constraint(equalTo: certificationTextFieldView.trailingAnchor)
        ])
    }
    
    private func certificationStackViewConstraints() {
        certificationStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        certificationStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 134),
        certificationStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
        certificationStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
    private func loverIdTextFieldConstraints() {
        loverIdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        loverIdTextField.topAnchor.constraint(equalTo: loverIdTextFieldView.topAnchor),
        loverIdTextField.bottomAnchor.constraint(equalTo: loverIdTextFieldView.bottomAnchor),
        loverIdTextField.leadingAnchor.constraint(equalTo: loverIdTextFieldView.leadingAnchor, constant: 20),
        loverIdTextField.trailingAnchor.constraint(equalTo: loverIdTextFieldView.trailingAnchor, constant: -20)
        ])
    }
    
    private func loverIdTextFieldViewConstraints() {
        loverIdTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        loverIdTextFieldView.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    private func idLinkingLabelConstraints() {
        idLinkingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        idLinkingLabel.leadingAnchor.constraint(equalTo: loverLinkingStackView.leadingAnchor, constant: 213),
        idLinkingLabel.trailingAnchor.constraint(equalTo: loverLinkingStackView.trailingAnchor, constant: -18)
        ])
        
    }
    
    private func loverLinkingStackViewConstraints() {
        loverLinkingStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loverLinkingStackView.topAnchor.constraint(equalTo: certificationStackView.bottomAnchor, constant: 36),
            loverLinkingStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            loverLinkingStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
    
        
        
        



}

extension SignUp3View: UITextFieldDelegate {
    
    // 키보드 엔터키가 눌렸을때 (다음 동작을 허락할 것인지)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if emailTextField.text != "", certificationNumberTextField.text != "", loverIdTextField.text != "" {
            loverIdTextField.resignFirstResponder()
            return true
        } else if emailTextField.text != "", certificationNumberTextField.text != "" {
            loverIdTextField.becomeFirstResponder()
            return true
        } else if emailTextField.text != "" {
            certificationNumberTextField.becomeFirstResponder()
            return true
        }
            return false
        }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        certificationNumberTextField.resignFirstResponder()
        loverIdTextField.resignFirstResponder()
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
        
        
        // 이메일 인증번호 최대 길이? 일단 100으로 설정
        switch textField {
        case emailTextField:
            guard emailTextField.text!.count < 100 else { return false }
            return true
        case certificationNumberTextField:
            guard certificationNumberTextField.text!.count < 100 else { return false }
            return true
        case loverIdTextField:
            guard loverIdTextField.text!.count < 10 else { return false }
            return true
        default:
            return true
        }

    }
}


