//
//  AddPostView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/16.
//

import UIKit

final class AddPostView: UIView {
    
    let addPostCellPagingImageView = CommunityCellPagingImageView()
    
    var addPostProfileView = CommunityProfileView()
    
    private var isKeyboardShown = false
        
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
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubviews()
        configureNotification()
        configureLayout()
        configureInitialSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addPostButtonStackView.layer.cornerRadius = addPostButtonStackView.frame.height / CGFloat(2)
        
        addPostTextView.textContainerInset = UIEdgeInsets(top: addPostProfileView.frame.height, left: 25, bottom: 0, right: 25)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: Configure InitialSetting
extension AddPostView {
    private func configureInitialSetting() {
        addPostTextView.delegate = self
        addPostDailyButton.isSelected = true
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
    
    @objc private func keyboardUpAction(notification: NSNotification) {
        
        guard !isKeyboardShown else {
            return
        }
        
        guard let userInfo: NSDictionary = notification.userInfo as? NSDictionary else {
            return
        }
        guard let keyboardFrame = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {
            return
        }
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        isKeyboardShown = true

        self.frame.origin.y -= keyboardHeight
        
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardDownAction() {
        isKeyboardShown = false
        
        self.frame.origin.y = 0

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
        
        [addPostCellPagingImageView,
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
        
        NSLayoutConstraint.activate([

            // MARK: postImageView Constraints
            addPostCellPagingImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.462),
            addPostCellPagingImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            addPostCellPagingImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            addPostCellPagingImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            addPostCellPagingImageView.widthAnchor.constraint(equalTo: addPostCellPagingImageView.heightAnchor),

            // MARK: addPostProfileView Constraints
            addPostProfileView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.077),
            addPostProfileView.centerXAnchor.constraint(equalTo: centerXAnchor),
            addPostProfileView.topAnchor.constraint(equalTo: addPostTextView.topAnchor),
            addPostProfileView.leadingAnchor.constraint(equalTo: addPostTextView.leadingAnchor, constant: 25),

            // MARK: addPostTextField Constraints
            addPostTextView.centerXAnchor.constraint(equalTo: centerXAnchor),

            addPostTextView.topAnchor.constraint(equalTo: addPostCellPagingImageView.bottomAnchor),
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
        addPostCellPagingImageView.isUserInteractionEnabled = true
        addPostCellPagingImageView.addGestureRecognizer(tapGesture)
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
    
    // 텍스트뷰를 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addPostTextView.resignFirstResponder()
    }
}
