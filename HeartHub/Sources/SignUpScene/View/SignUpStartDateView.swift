//
//  SignUpView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit

final class SignUpStartDateView: UIView {
    
    private let signUpBackgroundView = SignUpBackgroundView(
        heartImage: "HeartIcon0:3",
        ourStartLabelText: "우리의 시작",
        descriptionLabelText: "당신이 애인과 처음 사귀기 시작한 날은 언제인가요?")
    
    let signUpStartDatePreviousPageButton: UIButton = SignUpChangePageButton(buttonImage: "LeftArrow")
    let signUpStartDateNextPageButton: UIButton = SignUpChangePageButton(buttonImage: "RightArrow")
    
    private lazy var changePageButtonStackView: UIStackView = {
       let stView = UIStackView(arrangedSubviews: [signUpStartDatePreviousPageButton, signUpStartDateNextPageButton])
        stView.axis = .horizontal
        stView.spacing = 198
        stView.distribution = .fillEqually
        stView.alignment = .fill
        return stView
    }()
    
    private let startYearTextField: UITextField = SignUpDateTextField(placeholder: "YYYY")
    private let startMonthTextField: UITextField = SignUpDateTextField(placeholder: "MM")
    private let startDayTextField: UITextField = SignUpDateTextField(placeholder: "DD")
    
    private lazy var startDateStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [startYearTextField, startMonthTextField, startDayTextField])
        stView.spacing = 7
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
    }()
    
    // MARK: 뷰 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        configureSubviews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Configure Layout
extension SignUpStartDateView {
    
    private func setup() {
        backgroundColor = .white
        startYearTextField.delegate = self
        startMonthTextField.delegate = self
        startDayTextField.delegate = self
    }
    
    private func configureSubviews() {
        [signUpBackgroundView,
         changePageButtonStackView,
         startDateStackView
        ].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [signUpStartDatePreviousPageButton, signUpStartDateNextPageButton].forEach {
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
            
            // MARK: startDateStackView Constraints
            startDateStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.04),
            startDateStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            startDateStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 170),
            startDateStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            
            // MARK: startMonthTextFieldView Constraints
            startMonthTextField.widthAnchor.constraint(equalTo: startYearTextField.widthAnchor, multiplier: 0.81),

            // MARK: startDayTextFieldView Constraints
            startDayTextField.widthAnchor.constraint(equalTo: startMonthTextField.widthAnchor),

            // MARK: changePageButton Constraints
            signUpStartDatePreviousPageButton.heightAnchor.constraint(equalTo: signUpStartDatePreviousPageButton.widthAnchor),
            signUpStartDateNextPageButton.heightAnchor.constraint(equalTo: signUpStartDateNextPageButton.widthAnchor),
            
//            changePageButtonStackView.topAnchor.constraint(equalTo: startDateStackView.bottomAnchor, constant: 225),
            changePageButtonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -33),
            changePageButtonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            changePageButtonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
}

// MARK: 텍스트필드 델리게이트
extension SignUpStartDateView: UITextFieldDelegate {
    
    // 엔터누르면 다음 텍스트필드로 이동
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if startYearTextField.text != "", startMonthTextField.text != "", startDayTextField.text != "" {
            startDayTextField.resignFirstResponder()
            return true
        } else if startYearTextField.text != "", startMonthTextField.text != "" {
            startDayTextField.becomeFirstResponder()
            return true
        } else if startYearTextField.text != "" {
            startMonthTextField.becomeFirstResponder()
            return true
        }
            return false
        }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startYearTextField.resignFirstResponder()
        startMonthTextField.resignFirstResponder()
        startDayTextField.resignFirstResponder()
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
        case startYearTextField:
            maxLength = 4
            allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
            let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
            let currentYear = Calendar.current.component(.year, from: Date())
            if let year = Int(updatedText) {
                     if year >= 1950 && year <= currentYear {
                         return true
                     }
                 }
            
        case startMonthTextField:
            maxLength = 2
            allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
            let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
            if let month = Int(updatedText) {
                     if month >= 01 && month <= 12 {
                         return true
                     }
                 }
            
        case startDayTextField:
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
