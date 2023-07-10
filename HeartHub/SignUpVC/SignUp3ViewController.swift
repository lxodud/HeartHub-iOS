//
//  SignUp3ViewController.swift
//  test
//
//  Created by 제민우 on 2023/07/08.
//


import UIKit

class SignUp3ViewController: UIViewController {

    
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
    private lazy var emailCheckBtn: UIButton = {
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
        button.addTarget(self, action: #selector(didTapCertifyEmailBtn), for: .touchUpInside)
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
        view.addSubview(emailCheckBtn)

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
    private lazy var certificationNumberBtn: UIButton = {
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
        button.addTarget(self, action: #selector(didTapCertifyNumberBtn), for: .touchUpInside)
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
        view.addSubview(certificationNumberBtn)

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
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAutoLayout()
        assignDelegate()
    }
    
    func assignDelegate() {
        emailTextField.delegate = self
        certificationNumberTextField.delegate = self
        loverIdTextField.delegate = self
    }
    
    private func setupAutoLayout() {
        view.backgroundColor = .white
        
        view.addSubview(heartImgBackgroundView)
        view.addSubview(heartImg2View)
        view.addSubview(nextBtn)
        view.addSubview(startLabelStackView)
        view.addSubview(certificationStackView)
        view.addSubview(loverLinkingStackView)
                
        
        let margins = view.layoutMarginsGuide
        let textViewHeight: CGFloat = 35

        
        heartImgBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        heartImg2View.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        startLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        certificationStackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailCheckBtn.translatesAutoresizingMaskIntoConstraints = false
        certificationTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        certificationNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        certificationNumberBtn.translatesAutoresizingMaskIntoConstraints = false
        loverLinkingStackView.translatesAutoresizingMaskIntoConstraints = false
        loverIdTextField.translatesAutoresizingMaskIntoConstraints = false
        idLinkingLabel.translatesAutoresizingMaskIntoConstraints = false
                    
        NSLayoutConstraint.activate([
            heartImg2View.topAnchor.constraint(equalTo: margins.topAnchor, constant: 32),
            heartImg2View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 172),
            heartImg2View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -172),
             
            heartImgBackgroundView.topAnchor.constraint(equalTo: heartImg2View.topAnchor, constant: 3),
            heartImgBackgroundView.bottomAnchor.constraint(equalTo: heartImg2View.bottomAnchor, constant: -2.75 ),
            heartImgBackgroundView.leadingAnchor.constraint(equalTo: heartImg2View.leadingAnchor, constant: 0),
            heartImgBackgroundView.trailingAnchor.constraint(equalTo: heartImg2View.trailingAnchor, constant: 0),
            
            nextBtn.widthAnchor.constraint(equalToConstant: 50),
            nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56),
            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 315),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),

            startLabelStackView.topAnchor.constraint(equalTo: heartImg2View.bottomAnchor, constant: 50),
            startLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            startLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 76),
            
            // 이메일 입력 뷰 제약
            emailTextFieldView.heightAnchor.constraint(equalToConstant: textViewHeight),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 27),
            emailTextField.trailingAnchor.constraint(equalTo: emailCheckBtn.leadingAnchor, constant: 73),
            
            emailCheckBtn.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor),
            emailCheckBtn.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor),
            emailCheckBtn.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 255.22),
            emailCheckBtn.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor),

            // 인증번호 입력 뷰 제약
            certificationTextFieldView.heightAnchor.constraint(equalToConstant: textViewHeight),
            certificationNumberTextField.topAnchor.constraint(equalTo: certificationTextFieldView.topAnchor),
            certificationNumberTextField.bottomAnchor.constraint(equalTo: certificationTextFieldView.bottomAnchor),
            certificationNumberTextField.leadingAnchor.constraint(equalTo: certificationTextFieldView.leadingAnchor, constant: 27),
            certificationNumberTextField.trailingAnchor.constraint(equalTo: certificationNumberBtn.leadingAnchor),

            certificationNumberBtn.topAnchor.constraint(equalTo: certificationTextFieldView.topAnchor),
            certificationNumberBtn.bottomAnchor.constraint(equalTo: certificationTextFieldView.bottomAnchor),
            certificationNumberBtn.leadingAnchor.constraint(equalTo: certificationTextFieldView.leadingAnchor, constant: 255.22),
            certificationNumberBtn.trailingAnchor.constraint(equalTo: certificationTextFieldView.trailingAnchor),
            
            certificationStackView.topAnchor.constraint(equalTo: startLabelStackView.bottomAnchor, constant: 134),
            certificationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            certificationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            loverIdTextField.topAnchor.constraint(equalTo: loverIdTextFieldView.topAnchor),
            loverIdTextField.bottomAnchor.constraint(equalTo: loverIdTextFieldView.bottomAnchor),
            loverIdTextField.leadingAnchor.constraint(equalTo: loverIdTextFieldView.leadingAnchor, constant: 20),
            loverIdTextField.trailingAnchor.constraint(equalTo: loverIdTextFieldView.trailingAnchor, constant: -20),
            
            loverIdTextFieldView.heightAnchor.constraint(equalToConstant: textViewHeight),
            loverLinkingStackView.topAnchor.constraint(equalTo: certificationStackView.bottomAnchor, constant: 36),
            loverLinkingStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            loverLinkingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            idLinkingLabel.leadingAnchor.constraint(equalTo: loverLinkingStackView.leadingAnchor, constant: 213),
            idLinkingLabel.trailingAnchor.constraint(equalTo: loverLinkingStackView.trailingAnchor, constant: -18),

        ])
    }

    @objc func didTapNextBtn() {
        let signUp4VC = SignUp4ViewController()
        present(signUp4VC, animated: true, completion: nil)
    }
    @objc func didTapCertifyEmailBtn() {}
    @objc func didTapCertifyNumberBtn() {}
   
}

extension SignUp3ViewController: UITextFieldDelegate {
    
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
