//
//  SignUp3View.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit
import DropDown

class SignUp3View: UIView {
    
    let screenHeight = UIScreen.main.bounds.size.height
//    let textViewHeight: CGFloat = 35

    // MARK: 하트이미지
    // 하트이미지 1/3
    private lazy var heartImg2View: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartIcon2:3.png")
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
    
    
    // MARK: 회원가입화면3 상단 레이블
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
    
    // MARK: 이메일 입력 + dropDown 버튼
    // 이메일 입력 텍스트 필드
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.attributedPlaceholder = NSAttributedString(
                        string: "이메일을 입력하세요",
                        attributes: [
                            NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5),
                            NSAttributedString.Key.font:
                                UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .left
        return tf
    }()
    
    lazy var emailDropDown: DropDown = {
       var dropDown = DropDown()
        dropDown.dataSource = ["@naver.com", "@gmail.com", "@hanmail.com", "@kakao.com"]
        dropDown.textColor = UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5)
        dropDown.textFont = UIFont(name: "Pretendard-Regular", size: 14)!
        dropDown.backgroundColor = .white
        dropDown.anchorView = emailTextFieldView
        dropDown.bottomOffset = CGPoint(x: 215, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.width = 117
        dropDown.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dropDown.dismissMode = .onTap
        dropDown.separatorColor = #colorLiteral(red: 0.850980401, green: 0.850980401, blue: 0.850980401, alpha: 1)

        // dropDown 셀 중 하나가 선택되면
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            if var emailAdress = emailTextField.text {
                emailAdress = emailTextField.text! + item
                emailTextField.text! = emailAdress
            }
            if dropDownBtn.currentImage == UIImage(named: "DropUpArrow.png") {
                let downArrow = UIImage(named: "DropDownArrow.png")
                dropDownBtn.setImage(downArrow, for: .normal)}
          print("Selected item: \(item) at index: \(index)")
        }
        
        // dropDown이 해제될 때
        dropDown.cancelAction = { [unowned self] in
            if dropDownBtn.currentImage == UIImage(named: "DropUpArrow.png") {
                let downArrow = UIImage(named: "DropDownArrow.png")
                dropDownBtn.setImage(downArrow, for: .normal)}
        }
        return dropDown
    }()
    
    lazy var dropDownBtn: UIButton = {
        let btn = UIButton()
        let downArrow = UIImage(named: "DropDownArrow.png")
        let upArrow = UIImage(named: "DropUpArrow.png")
        
        btn.setImage(downArrow, for: .normal)
        btn.contentMode = .center
        btn.tintColor = .black
        return btn
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
        view.addSubview(dropDownBtn)
       return view
    }()
    
    // 이메일 형식 제약조건 레이블
    private lazy var emailFormatDescriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "이메일의 형식이 올바르지 않습니다."
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.isHidden = true
        label.textColor = #colorLiteral(red: 1, green: 0.01488391776, blue: 0.006827606354, alpha: 1)
        return label
    }()
    
    // MARK: 애인 아이디 입력
    // 애인아이디 입력 텍스트필드
    private lazy var loverIdTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .default
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.attributedPlaceholder = NSAttributedString(
                        string: "(선택) 내 애인의 아이디를 입력하세요",
                        attributes: [
                            NSAttributedString.Key.foregroundColor:
                                UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5),
                            NSAttributedString.Key.font:
                                UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .left
        return tf
    }()
    
    // 애인아이디 입력 뷰
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
    
    // 닉네임, 이메일 입력 스택뷰
    private lazy var enterStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [emailTextFieldView, loverIdTextFieldView])
        stView.spacing = 36
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    // 아이디로 계정연동 레이블
    private var loverIdLinkingLabel: UILabel = {
        let label = UILabel()
        label.text = "계정연동 시 서로의 스크랩 목록을 확인할 수 있습니다."
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
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
        [heartImg2View,
        startLabelStackView,
        enterStackView,
        emailFormatDescriptionLabel,
        loverIdLinkingLabel,
         arrowBtnStackView,].forEach { addSubview($0)}
    }
    
    func setup() {
        backgroundColor = .white

        emailTextField.delegate = self
        loverIdTextField.delegate = self
        loverIdTextField.delegate = self
    }
    
    // MARK: 제약

    private func constraints() {
        heartImg2ViewConstraints()
        arrowBtnConstraints()
        
        startLabelStackViewConstraints()
        
//        emailTextFieldViewConstraints()
        emailTextFieldConstraints()
        emailFormatDescriptionLabelConstraints()
        
        loverIdTextFieldViewConstraints()
        loverIdTextFieldConstraints()
        
        dropDownBtnConstraints()
        
        enterStackViewConstraints()
        idLinkingLabelConstraints()
    }

    private func heartImg2ViewConstraints() {
        heartImg2View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImg2View.heightAnchor.constraint(equalTo: heartImg2View.widthAnchor),
            heartImg2View.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartImg2View.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            heartImg2View.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 172),
        ])
    }
    
    private func startLabelStackViewConstraints() {
        startLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabelStackView.topAnchor.constraint(equalTo: heartImg2View.bottomAnchor, constant: 34),
            startLabelStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            startLabelStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -120)
        ])
    }
    
    private func enterStackViewConstraints() {
        enterStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 181),
            enterStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            enterStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -31)
        ])
    }
    
    private func arrowBtnConstraints() {
        arrowBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightArrowBtn.heightAnchor.constraint(equalTo: rightArrowBtn.widthAnchor),
            leftArrowBtn.heightAnchor.constraint(equalTo: leftArrowBtn.widthAnchor),
            arrowBtnStackView.topAnchor.constraint(equalTo: loverIdLinkingLabel.bottomAnchor, constant: 225),
            arrowBtnStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -33),
            arrowBtnStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            arrowBtnStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
    
//    private func emailTextFieldViewConstraints() {
//        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            emailTextFieldView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: textViewHeight / screenHeight)
//        ])
//    }
    
    private func emailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 27),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -73)
        ])
    }
    
    private func emailFormatDescriptionLabelConstraints() {
        emailFormatDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailFormatDescriptionLabel.topAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor),
            emailFormatDescriptionLabel.bottomAnchor.constraint(equalTo: loverIdTextFieldView.topAnchor, constant: -4),
            emailFormatDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 46),
            emailFormatDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -154)
        ])
    }
    
//    private func emailCheckBtnConstraints() {
//        emailCertifyBtn.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//        emailCertifyBtn.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor),
//        emailCertifyBtn.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor),
//        emailCertifyBtn.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 255.22),
//        emailCertifyBtn.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor)
//        ])
//    }
    
    private func loverIdTextFieldViewConstraints() {
        loverIdTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loverIdTextFieldView.heightAnchor.constraint(equalTo: emailTextFieldView.heightAnchor)
        ])
    }
    
    private func loverIdTextFieldConstraints() {
        loverIdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loverIdTextField.topAnchor.constraint(equalTo: loverIdTextFieldView.topAnchor),
            loverIdTextField.bottomAnchor.constraint(equalTo: loverIdTextFieldView.bottomAnchor),
            loverIdTextField.leadingAnchor.constraint(equalTo: loverIdTextFieldView.leadingAnchor, constant: 27),
            loverIdTextField.trailingAnchor.constraint(equalTo: dropDownBtn.leadingAnchor, constant: -10)
        ])
    }
    
    private func dropDownBtnConstraints() {
        dropDownBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropDownBtn.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 6),
            dropDownBtn.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -5),
            dropDownBtn.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 293),
            dropDownBtn.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -12)
        ])
    }
    
    private func idLinkingLabelConstraints() {
        loverIdLinkingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loverIdLinkingLabel.topAnchor.constraint(equalTo: loverIdTextFieldView.bottomAnchor, constant: 3),
            loverIdLinkingLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 46),
            loverIdLinkingLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -59)
        ])
        
    }
}

// MARK: 텍스트필드 델리게이트

extension SignUp3View: UITextFieldDelegate {
    // 키보드 엔터키가 눌렸을때 (다음 동작을 허락할 것인지)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if emailTextField.text != "", loverIdTextField.text != "", loverIdTextField.text != "" {
            loverIdTextField.resignFirstResponder()
            return true
        } else if emailTextField.text != "", loverIdTextField.text != "" {
            loverIdTextField.becomeFirstResponder()
            return true
        } else if emailTextField.text != "" {
            loverIdTextField.becomeFirstResponder()
            return true
        }
            return false
        }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        loverIdTextField.resignFirstResponder()
        loverIdTextField.resignFirstResponder()
    }
    
    // 이메일 텍스트필드 형식 제약조건
    func textFieldDidEndEditing(_ textField: UITextField) {
        let idPattern = #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"#
        let isVaildPattern = (emailTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
        if emailTextField.text!.isEmpty {
            emailFormatDescriptionLabel.isHidden = true
        } else if isVaildPattern {
            emailFormatDescriptionLabel.isHidden = true
        } else {
            emailFormatDescriptionLabel.isHidden = false
        }
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
        
        guard let text = textField.text else {
            return true
        }
        
        let maxLength: Int
        var allowedCharacterSet: CharacterSet
        
        switch textField {
        case emailTextField:
            maxLength = 100
            allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&'*+-/=?^_`{|}~.(),:;<>@")
        case loverIdTextField:
            maxLength = 18
            allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_?+=~")
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


