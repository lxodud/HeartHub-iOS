//
//  SignUp3View.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit
import DropDown

final class SignUpLoverLinkingView: UIView {
    
    private let signUpBackgroundView = SignUpBackgroundView(
        heartImage: "HeartIcon2:3",
        ourStartLabelText: "사랑을 시작해볼까요?",
        descriptionLabelText: "계정을 생성하여 HeartHuB를 즐겨보아요.")
    
    private lazy var nickNameTextField = SignUpUserInfoTextField(
        placeholder: "닉네임을 입력해주세요.",
        keyboardType: .default,
        isSecureTextEntry: false)
    
    private var nickNameDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "한글/영문/숫자/특수문자 구성"
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.46, green: 0.46, blue: 0.46, alpha: 1)
        return label
    }()
    
    var nickNameCheckButton: UIButton = {
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
    
    // MARK: 이메일 입력 + dropDown 버튼
    // 이메일 입력 텍스트 필드
    private var emailTextField = SignUpUserInfoTextField(
        placeholder: "이메일을 입력해주세요",
        keyboardType: .emailAddress,
        isSecureTextEntry: false)
    
    lazy var emailDropDown: DropDown = {
        var dropDown = DropDown()
        dropDown.dataSource = ["@naver.com", "@gmail.com", "@hanmail.com", "@kakao.com"]
        dropDown.textColor = UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 0.5)
        dropDown.textFont = UIFont(name: "Pretendard-Regular", size: 14)!
        dropDown.backgroundColor = .white
        dropDown.width = 117
        dropDown.anchorView = emailTextField
        let xOffset = emailTextField.bounds.width - (dropDown.width)!
        dropDown.bottomOffset = CGPoint(x: xOffset, y:(dropDown.anchorView?.plainView.bounds.height)!)
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
    
    // 닉네임, 이메일 입력 스택뷰
    private lazy var enterStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [nickNameTextField, emailTextField])
        stView.spacing = 36
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    let signUpLoverPreviousPageButton = SignUpChangePageButton(buttonImage: "LeftArrow")
    let signUpLoverNextPageButton = SignUpChangePageButton(buttonImage: "RightArrow")
    
    private lazy var changePageButtonStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [signUpLoverPreviousPageButton, signUpLoverNextPageButton])
        stView.axis = .horizontal
        stView.spacing = 198
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    // MARK: 뷰 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubViews()
        configureLayout()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure Layout
extension SignUpLoverLinkingView {
    func configureSubViews() {
        nickNameTextField.addSubview(nickNameCheckButton)
        emailTextField.addSubview(dropDownBtn)
        
        [signUpBackgroundView,
         enterStackView,
         nickNameDescriptionLabel,
         emailFormatDescriptionLabel,
         changePageButtonStackView,].forEach{
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [nickNameTextField,
         emailTextField,
         nickNameCheckButton,
         dropDownBtn,
         signUpLoverPreviousPageButton,
         signUpLoverNextPageButton
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    func setup() {
        backgroundColor = .white

        emailTextField.delegate = self
        nickNameTextField.delegate = self
        nickNameTextField.delegate = self
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
            
            // MARK: enterStackView Constraints
            enterStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            enterStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 170),
            enterStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            
            nickNameTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04),
            
            emailTextField.heightAnchor.constraint(equalTo: nickNameTextField.heightAnchor),
            
            nickNameCheckButton.topAnchor.constraint(equalTo: nickNameTextField.topAnchor),
            nickNameCheckButton.bottomAnchor.constraint(equalTo: nickNameTextField.bottomAnchor),
            nickNameCheckButton.leadingAnchor.constraint(equalTo: nickNameTextField.leadingAnchor, constant: 255.22),
            nickNameCheckButton.trailingAnchor.constraint(equalTo: nickNameTextField.trailingAnchor),

            // MARK: nickNameDescriptionLabel Constraints
            nickNameDescriptionLabel.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: 3),
            nickNameDescriptionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 42),
            
            // MARK: emailFormatDescriptionLabel Constraints
            emailFormatDescriptionLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            emailFormatDescriptionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 46),

            // MARK: dropDownBtn Constraints
            dropDownBtn.topAnchor.constraint(equalTo: emailTextField.topAnchor, constant: 6),
            dropDownBtn.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -5),
            dropDownBtn.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor, constant: 293),
            dropDownBtn.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: -12),
            
            // MARK: changePageButton Constraints
            signUpLoverPreviousPageButton.heightAnchor.constraint(equalTo: signUpLoverPreviousPageButton.widthAnchor),
            signUpLoverNextPageButton.heightAnchor.constraint(equalTo: signUpLoverNextPageButton.widthAnchor),
            changePageButtonStackView.topAnchor.constraint(equalTo: emailFormatDescriptionLabel.bottomAnchor, constant: 219),
            changePageButtonStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -33),
            changePageButtonStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            changePageButtonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40)
        ])
    }
}

// MARK: 텍스트필드 델리게이트
extension SignUpLoverLinkingView: UITextFieldDelegate {
    // 키보드 엔터키가 눌렸을때 (다음 동작을 허락할 것인지)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if emailTextField.text != "", nickNameTextField.text != "", nickNameTextField.text != "" {
            nickNameTextField.resignFirstResponder()
            return true
        } else if emailTextField.text != "", nickNameTextField.text != "" {
            nickNameTextField.becomeFirstResponder()
            return true
        } else if emailTextField.text != "" {
            nickNameTextField.becomeFirstResponder()
            return true
        }
            return false
        }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        nickNameTextField.resignFirstResponder()
        nickNameTextField.resignFirstResponder()
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
        case nickNameTextField:
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
