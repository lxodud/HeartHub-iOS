//
//  AddPostView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/16.
//

import UIKit

final class AddPostView: UIView {
    let postImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "AddPostImage")
        return imageView
    }()
    
    private var addPostProfileView = CommunityProfileView()
        
    private let addPostTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Pretendard-Regular", size: 16)
        textView.textColor = .black
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.text = "문구를 입력해주세요."
        textView.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        return textView
    }()
    
    var addPostDailyButton = AddPostButton(text: "Daily", backgroundColor: .black)
    var addPostLookButton = AddPostButton(text: "Look", backgroundColor: .white)
    var addPostDateButton = AddPostButton(text: "Date", backgroundColor: .white)
    
    private let addPostButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        stackView.backgroundColor = .white
        
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.masksToBounds = false
        stackView.layer.shadowOffset = CGSize(width: 0, height: 4)
        stackView.layer.shadowRadius = 5
        stackView.layer.shadowOpacity = 0.3
        
        return stackView
    }()
    
    private var addPostTextViewTopConstraints: NSLayoutConstraint!
    private var textViewTopConstant: CGFloat = 390
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubviews()
        configureNotification()
        configureLayout()
        addPostTextView.delegate = self
        addPostDailyButton.isSelected = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addPostButtonStackView.layer.cornerRadius = addPostButtonStackView.frame.height / CGFloat(2)
        
        addPostTextView.textContainerInset = UIEdgeInsets(top: addPostProfileView.frame.height, left: 25, bottom: 0, right: 25)
        textViewTopConstant = postImageView.frame.height
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: Configure Notification
extension AddPostView {
    private func configureNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardUpAction),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardDownAction),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardUpAction() {
        addPostTextViewTopConstraints.constant = 0
        
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardDownAction() {
        addPostTextViewTopConstraints.constant = postImageView.frame.height
        
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
}

// MARK: Configure Layout
extension AddPostView {
    
    private func configureSubviews() {
        addPostTextView.addSubview(addPostProfileView)
        addPostTextView.translatesAutoresizingMaskIntoConstraints = false
        
        [addPostDailyButton, addPostLookButton, addPostDateButton].forEach {
            addPostButtonStackView.addArrangedSubview($0)
        }
        
        [postImageView,
         addPostTextView,
         addPostProfileView,
         addPostButtonStackView
        ].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        addPostTextViewTopConstraints = addPostTextView.topAnchor.constraint(
            equalTo: safeArea.topAnchor,
            constant: textViewTopConstant
        )
        
        NSLayoutConstraint.activate([
            // MARK: postImageView Constraints
            postImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.462),
            postImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            postImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),

            // MARK: addPostProfileView Constraints
            addPostProfileView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.077),
            addPostProfileView.centerXAnchor.constraint(equalTo: centerXAnchor),
            addPostProfileView.topAnchor.constraint(equalTo: addPostTextView.topAnchor),
            addPostProfileView.leadingAnchor.constraint(equalTo: addPostTextView.leadingAnchor, constant: 25),

            // MARK: addPostTextField Constraints
            addPostTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            addPostTextViewTopConstraints,
            addPostTextView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            addPostTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            // MARK: addPostButtonStackView Constraints
            addPostButtonStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066),
            addPostButtonStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.512),
            addPostButtonStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -21),
            addPostButtonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -21),
        ])
    }
}

// MARK: GestureRecognizer Delegate Implement
extension AddPostView: UIGestureRecognizerDelegate {
    func configureTapPostImageAction(_ target: Any, _ action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.delegate = self
        postImageView.isUserInteractionEnabled = true
        postImageView.addGestureRecognizer(tapGesture)
    }
}

// MARK: TextView Delegate Implement
extension AddPostView: UITextViewDelegate {
    // 플레이스홀더 기능 구현
    func textViewDidBeginEditing(_ textView: UITextView) {
        if addPostTextView.text == "문구를 입력해주세요." {
            addPostTextView.text = nil
            addPostTextView.textColor = .black
        }
        addPostTextView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if addPostTextView.text == "" {
            addPostTextView.text = "문구를 입력해주세요."
            addPostTextView.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        }
    }
    
    // 텍스트뷰를 종료
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            addPostTextView.resignFirstResponder()
        }
    
    // 텍스트뷰를 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addPostTextView.resignFirstResponder()
    }
    
}
