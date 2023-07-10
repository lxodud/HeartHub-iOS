
//
//  SignUpViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/07/06.
//

import UIKit

class SignUpViewController: UIViewController {

    
    // MARK: 하트이미지
    
    // 하트이미지 배경
    private lazy var heartImgBackgroundView: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartBackgorund.png")
        return img
    }()
    
    // 하트이미지 0/3
    private lazy var heartImg0View: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .clear
        img.image = UIImage(named: "HeartIcon0:3.png")
        img.addSubview(heartImgBackgroundView)
        return img
    }()
    

    
    // 다음화면 넘어가는 버튼
    private lazy var nextBtn: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfiguration = UIImage.SymbolConfiguration(weight: .thin)
        let symbolImage = UIImage(systemName: "arrow.right.circle", withConfiguration: symbolConfiguration)
        button.setImage(symbolImage, for: .normal)
        button.contentMode = .center
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapNextBtn), for: .touchUpInside)
        return button
    }()
    
    // MARK: 회원가입 초기화면 레이블
    // 우리의 시작 레이블
    private var startLabel: UILabel = {
        let label = UILabel()
        label.text = "우리의 시작"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        return label
    }()
    
    // 설명 레이블
    private var startExplainLabel: UILabel = {
        let label = UILabel()
        label.text = "당신이 애인과 처음 사귀기 시작한 날은 언제인가요?"
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

    // MARK: 생년월일
    // 시작년도 텍스트 필드
    private lazy var startYearTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = .clear
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
        tf.placeholder = "MM"
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
        tf.placeholder = "DD"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        autoLayout()
        assignDelegate()
    }
    
    func assignDelegate() {
        startYearTextField.delegate = self
        startMonthTextField.delegate = self
        startDayTextField.delegate = self
    }
    
    private func autoLayout() {
        view.backgroundColor = .white
        
        view.addSubview(heartImgBackgroundView)
        view.addSubview(heartImg0View)
        view.addSubview(nextBtn)
        view.addSubview(startLabelStackView)
        view.addSubview(startDateStackView)
        
        let margins = view.layoutMarginsGuide
        
        heartImgBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        heartImg0View.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        startLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        startDateStackView.translatesAutoresizingMaskIntoConstraints = false
        startYearTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        startMonthTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        startDayTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        startYearTextField.translatesAutoresizingMaskIntoConstraints = false
        startMonthTextField.translatesAutoresizingMaskIntoConstraints = false
        startDayTextField.translatesAutoresizingMaskIntoConstraints = false

            

        
        NSLayoutConstraint.activate([
            heartImg0View.topAnchor.constraint(equalTo: margins.topAnchor, constant: 32),
            heartImg0View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 172),
            heartImg0View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -172),
             
            heartImgBackgroundView.topAnchor.constraint(equalTo: heartImg0View.topAnchor, constant: 3),
            heartImgBackgroundView.bottomAnchor.constraint(equalTo: heartImg0View.bottomAnchor, constant: -2.75),
            heartImgBackgroundView.leadingAnchor.constraint(equalTo: heartImg0View.leadingAnchor, constant: 0),
            heartImgBackgroundView.trailingAnchor.constraint(equalTo: heartImg0View.trailingAnchor, constant: 0),
            
            nextBtn.widthAnchor.constraint(equalToConstant: 50),
            nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56),
            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 315),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            startLabelStackView.topAnchor.constraint(equalTo: heartImg0View.bottomAnchor, constant: 50),
            startLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            startLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 76),
            
            startYearTextField.topAnchor.constraint(equalTo: startYearTextFieldView.topAnchor),
            startYearTextField.bottomAnchor.constraint(equalTo: startYearTextFieldView .bottomAnchor),
            startYearTextField.leadingAnchor.constraint(equalTo: startYearTextFieldView.leadingAnchor, constant: 22),
            startYearTextField.trailingAnchor.constraint(equalTo: startYearTextFieldView.trailingAnchor, constant: -22),
            
            startMonthTextField.topAnchor.constraint(equalTo: startMonthTextFieldView.topAnchor),
            startMonthTextField.bottomAnchor.constraint(equalTo: startMonthTextFieldView.bottomAnchor),
            startMonthTextField.leadingAnchor.constraint(equalTo: startMonthTextFieldView.leadingAnchor, constant: 22),
            startMonthTextField.trailingAnchor.constraint(equalTo: startMonthTextFieldView.trailingAnchor, constant: -22),
            
            startDayTextField.topAnchor.constraint(equalTo: startDayTextFieldView.topAnchor),
            startDayTextField.bottomAnchor.constraint(equalTo: startDayTextFieldView.bottomAnchor),
            startDayTextField.leadingAnchor.constraint(equalTo: startDayTextFieldView.leadingAnchor, constant: 22),
            startDayTextField.trailingAnchor.constraint(equalTo: startDayTextFieldView.trailingAnchor, constant: -22),
            
            startDateStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 226),
            startDateStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            startDateStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -49),
            startDateStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 35),
            
            startYearTextFieldView.widthAnchor.constraint(equalToConstant: 105),
            startMonthTextFieldView.widthAnchor.constraint(equalToConstant: 86),
            startDayTextFieldView.widthAnchor.constraint(equalToConstant: 86),
            
            
        ])
        
    }

    @objc func didTapNextBtn() {
        let signUp2VC = SignUp2ViewController()
        present(signUp2VC, animated: true, completion: nil)
    }
   
}

extension SignUpViewController: UITextFieldDelegate {
    
    // 키보드 엔터키가 눌렸을때 (다음 동작을 허락할 것인지)
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
        case startYearTextField:
            guard startYearTextField.text!.count < 4 else { return false }
            return true
        case startMonthTextField:
            guard startMonthTextField.text!.count < 2 else { return false }
            return true
        case startDayTextField:
            guard startDayTextField.text!.count < 2 else { return false }
            return true
        default:
            return true
        }

    }

    
}
