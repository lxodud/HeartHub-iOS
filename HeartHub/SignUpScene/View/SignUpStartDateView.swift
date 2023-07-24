//
//  SignUpView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/11.
//

import UIKit

class SignUpStartDateView: UIView {

    // MARK: 하트이미지
    // 하트이미지 0/3
    private lazy var heartImg0View: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartIcon0:3.png")
        return img
    }()
    

    
// MARK: 다음화면 버튼
    
    lazy var rightArrowBtn: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = false
        btn.setImage(UIImage(named: "RightArrow"), for: .normal)
        btn.contentMode = .center
        return btn
    }()
    
    // MARK: 회원가입 초기화면 레이블
    // 우리의 시작 레이블
    private var startLabel: UILabel = {
        let label = UILabel()
        label.text = "우리의 시작"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 20)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 설명 레이블
    private var startExplainLabel: UILabel = {
        let label = UILabel()
        label.text = "당신이 애인과 처음 사귀기 시작한 날은 언제인가요?"
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

    // MARK: 생년월일
    // 시작년도 텍스트 필드
    private lazy var startYearTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.attributedPlaceholder = NSAttributedString(
                        string: "YYYY",
                        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5),
                                     NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .numberPad
        tf.placeholder = "YYYY"
        tf.textAlignment = .center
        return tf
    }()
    
    // 시작 년도 뷰
    private lazy var startYearTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(startYearTextField)
       return view
    }()
    
    // 시작 월 텍스트 필드
    private lazy var startMonthTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .numberPad
        tf.attributedPlaceholder = NSAttributedString(
                        string: "MM",
                        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5),
                                     NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .center
        return tf
    }()
    
    // 시작 월 뷰
    private lazy var startMonthTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(startMonthTextField)
       return view
    }()
    
    // 시작 일 텍스트 필드
    private lazy var startDayTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        tf.keyboardType = .numberPad
        tf.attributedPlaceholder = NSAttributedString(
                        string: "DD",
                        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5),
                                     NSAttributedString.Key.font: UIFont(name: "Pretendard-Regular", size: 14)!
                                    ])
        tf.textAlignment = .center
        return tf
    }()
    
    // 시작 일 뷰
    private lazy var startDayTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderColor = #colorLiteral(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
        view.layer.borderWidth = 1
        view.addSubview(startDayTextField)
       return view
    }()
    
    //  시작 날짜 스택뷰
    private lazy var startDateStackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [startYearTextFieldView, startMonthTextFieldView, startDayTextFieldView])
        stView.spacing = 7
        stView.axis = .horizontal
        stView.distribution = .fill
        stView.alignment = .fill
        return stView
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
    

    
    private func setup() {
        backgroundColor = .white
        startYearTextField.delegate = self
        startMonthTextField.delegate = self
        startDayTextField.delegate = self
    }
    
    private func addViews() {
        backgroundColor = .white
        
        [heartImg0View,
         rightArrowBtn,
         startLabelStackView,
         startDateStackView].forEach { addSubview($0)}

    }
    
    // MARK: 제약
    private func constraints() {
        heartImg0ViewConstraints()
        rightArrowBtnConstraints()
        startLabelStackViewConstraints()
        startDateStackViewConstraints()
        startYearTextFieldConstraints()
        startMonthTextFieldConstraints()
        startDayTextFieldConstraints()
        startYearTextFieldViewConstraints()
        startMonthTextFieldViewConstraints()
        startDayTextFieldViewConstraints()
    }
    
    private func heartImg0ViewConstraints() {
        heartImg0View.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartImg0View.heightAnchor.constraint(equalTo: heartImg0View.widthAnchor),
            heartImg0View.centerXAnchor.constraint(equalTo: centerXAnchor),
            heartImg0View.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 4),
            heartImg0View.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 172),
        ])
    }

    private func startLabelStackViewConstraints() {
        startLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabelStackView.topAnchor.constraint(equalTo: heartImg0View.bottomAnchor, constant: 34),
            startLabelStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
            startLabelStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -76)
        ])
    }
    
    private func startDateStackViewConstraints() {
        startDateStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startDateStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 226),
            startDateStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            startDateStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
//            startDateStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 35)
        ])
    }
    
    private func rightArrowBtnConstraints() {
        rightArrowBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightArrowBtn.heightAnchor.constraint(equalTo: rightArrowBtn.widthAnchor),
            rightArrowBtn.topAnchor.constraint(equalTo: startDateStackView.bottomAnchor, constant: 272),
            rightArrowBtn.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -33),
            rightArrowBtn.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 294),
            rightArrowBtn.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40)
        ])
    }
    
    private func startYearTextFieldConstraints() {
        startYearTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startYearTextField.centerYAnchor.constraint(equalTo: startYearTextFieldView.centerYAnchor),
            startYearTextField.topAnchor.constraint(equalTo: startYearTextFieldView.topAnchor, constant: 7),
            startYearTextField.leadingAnchor.constraint(equalTo: startYearTextFieldView.leadingAnchor, constant: 22),
            startYearTextField.trailingAnchor.constraint(equalTo: startYearTextFieldView.trailingAnchor, constant: -22)
        ])
    }
    
    private func startMonthTextFieldConstraints() {
        startMonthTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startMonthTextField.centerYAnchor.constraint(equalTo: startMonthTextFieldView.centerYAnchor),
            startMonthTextField.topAnchor.constraint(equalTo: startMonthTextFieldView.topAnchor),
            startMonthTextField.leadingAnchor.constraint(equalTo: startMonthTextFieldView.leadingAnchor, constant: 23),
            startMonthTextField.trailingAnchor.constraint(equalTo: startMonthTextFieldView.trailingAnchor, constant: -23)
        ])
    }
    
    private func startDayTextFieldConstraints() {
        startDayTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startDayTextField.centerYAnchor.constraint(equalTo: startDayTextFieldView.centerYAnchor),
            startDayTextField.topAnchor.constraint(equalTo: startDayTextFieldView.topAnchor),
            startDayTextField.leadingAnchor.constraint(equalTo: startDayTextFieldView.leadingAnchor, constant: 23),
            startDayTextField.trailingAnchor.constraint(equalTo: startDayTextFieldView.trailingAnchor, constant: -23)
        ])
    }
    


    private func startYearTextFieldViewConstraints() {
//        startYearTextFieldView.translatesAutoresizingMaskIntoConstraints = false
//        startYearTextFieldView.widthAnchor.constraint(equalToConstant: 105).isActive = true
    }
    
    private func startMonthTextFieldViewConstraints() {
        startMonthTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        startMonthTextFieldView.widthAnchor.constraint(equalTo: startYearTextFieldView.widthAnchor, multiplier: 0.81).isActive = true
    }
    
    private func startDayTextFieldViewConstraints() {
        startDayTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        startDayTextFieldView.widthAnchor.constraint(equalTo: startMonthTextFieldView.widthAnchor).isActive = true
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
