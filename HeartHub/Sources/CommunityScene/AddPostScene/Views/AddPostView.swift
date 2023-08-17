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
        imageView.image = UIImage(named: "TestImage")
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
    
    var addPostDailyButton = AddPostButton(text: "Daily")
    var addPostLookButton = AddPostButton(text: "Look")
    var addPostDateButton = AddPostButton(text: "Date")
    
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureSubviews()
        configureLayout()
        addPostTextView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addPostButtonStackView.layer.cornerRadius = addPostButtonStackView.frame.height / CGFloat(2)
    }
}

// MARK: Configure Layout
extension AddPostView {
    
    private func configureSubviews() {
        [addPostDailyButton, addPostLookButton, addPostDateButton].forEach {
            addPostButtonStackView.addArrangedSubview($0)
        }
        
        [postImageView,
         addPostProfileView,
         addPostTextView,
         addPostButtonStackView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // MARK: postImageView Constraints
            postImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.462),
            postImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            postImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),

            // MARK: addPostProfileView Constraints
            addPostProfileView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.077),
            addPostProfileView.topAnchor.constraint(equalTo: postImageView.bottomAnchor),
            addPostProfileView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 25),
            addPostProfileView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),

            // MARK: addPostTextField Constraints
            addPostTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.246),
            addPostTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            addPostTextView.topAnchor.constraint(equalTo: addPostProfileView.bottomAnchor),
            addPostTextView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            addPostTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            // MARK: addPostButtonStackView Constraints
            addPostButtonStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.066),
            addPostButtonStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.512),
            addPostButtonStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -21),
            addPostButtonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -21),
        ])
    }
}

// MARK: TextView Delegate Implement
extension AddPostView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        addPostTextView.text = ""
        addPostTextView.textColor = .black
    }
    
    // 텍스트필드를 모두 종료 (키보드 내려가기)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            addPostTextView.resignFirstResponder()
        }
    
    // 텍스트필드 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addPostTextView.resignFirstResponder()
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
