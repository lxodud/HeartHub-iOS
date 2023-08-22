//
//  AlbumImagePickerView.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/22.
//

import UIKit

final class AlbumImagePickerView: UIView {

    let albumCellPagingImageView = CommunityCellPagingImageView()
    
    private var isKeyboardShown = false
        
    private let addAlbumMainTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Pretendard-Regular", size: 20)
        textView.textColor = .black
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.text = "제목을 입력해주세요."
        textView.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        return textView
    }()
    
    private let addAlbumTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "Pretendard-Regular", size: 16)
        textView.textColor = .black
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.text = "내용을 입력해주세요."
        textView.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
        return textView
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
        addAlbumMainTextView.textContainerInset = UIEdgeInsets(top: 30, left: 25, bottom: 0, right: 25)
        
        addAlbumTextView.textContainerInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: Configure InitialSetting
extension AlbumImagePickerView {
    private func configureInitialSetting() {
        addAlbumMainTextView.delegate = self
        addAlbumTextView.delegate = self
    }
}

// MARK: Configure Notification
extension AlbumImagePickerView {
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
extension AlbumImagePickerView {
    
    private func configureSubviews() {
        addAlbumTextView.translatesAutoresizingMaskIntoConstraints = false
        
        [albumCellPagingImageView, addAlbumMainTextView, addAlbumTextView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([

            // MARK: postImageView Constraints
            albumCellPagingImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.462),
            albumCellPagingImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            albumCellPagingImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            albumCellPagingImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            albumCellPagingImageView.widthAnchor.constraint(equalTo: albumCellPagingImageView.heightAnchor),

            // MARK: addPostTextField Constraints
            addAlbumMainTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.0687),
            addAlbumMainTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            addAlbumMainTextView.topAnchor.constraint(equalTo: albumCellPagingImageView.bottomAnchor),
            addAlbumMainTextView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            // MARK: addPostTextField Constraints
            addAlbumTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            addAlbumTextView.topAnchor.constraint(equalTo: addAlbumMainTextView.bottomAnchor),
            addAlbumTextView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            addAlbumTextView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}

// MARK: GestureRecognizer Delegate Implement
extension AlbumImagePickerView: UIGestureRecognizerDelegate {
    func configureTapPostImageAction(_ target: Any, _ action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        tapGesture.delegate = self
        albumCellPagingImageView.isUserInteractionEnabled = true
        albumCellPagingImageView.addGestureRecognizer(tapGesture)
    }
}

// MARK: TextView Delegate Implement
extension AlbumImagePickerView: UITextViewDelegate {
    // 플레이스홀더 기능 구현
    func textViewDidBeginEditing(_ textView: UITextView) {
        switch textView {
        case addAlbumMainTextView:
            if addAlbumMainTextView.text == "제목을 입력해주세요." {
                addAlbumMainTextView.text = ""
                addAlbumMainTextView.textColor = .black
            }
            addAlbumMainTextView.textColor = .black
        case addAlbumTextView:
            if addAlbumTextView.text == "내용을 입력해주세요." {
                addAlbumTextView.text = ""
                addAlbumTextView.textColor = .black
            }
            addAlbumTextView.textColor = .black
        default:
            break
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        switch textView {
        case addAlbumMainTextView:
            if addAlbumMainTextView.text == "" {
                addAlbumMainTextView.text = "제목을 입력해주세요."
                addAlbumMainTextView.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
            }
        case addAlbumTextView:
            if addAlbumTextView.text == "" {
                addAlbumTextView.text = "내용을 입력해주세요."
                addAlbumTextView.textColor = #colorLiteral(red: 0.07, green: 0.07, blue: 0.07, alpha: 0.5)
            }
        default:
            break
        }

    }
    
    // 텍스트뷰를 이외의 영역을 눌렀을때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        addAlbumTextView.resignFirstResponder()
    }
}
