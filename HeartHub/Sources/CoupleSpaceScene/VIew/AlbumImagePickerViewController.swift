//
//  AlbumImagePickerViewController.swift
//  HeartHub
//
//  Created by 전제윤 on 2023/08/21.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController  {

    private var albumWriteLabel: UILabel = {
        let name = UILabel()
        name.text = "앨범 작성"
        name.textAlignment = .center
        name.font = UIFont(name: "Pretendard-SemiBold", size: 20)
        name.textColor = .black
        return name
    }()
    
    var completeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("완료", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20.0)
        btn.setTitleColor(.systemBlue, for: .normal)
        return btn
    }()
    
    private lazy var imagePickerView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.isUserInteractionEnabled = true
        imageView.addSubview(imagePickerbtn)
        return imageView
    }()
    
    private var imagePickerbtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()

    
    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setConstraints()
        configureTapGesture()
    }
    
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imagePickerbtnTapped))
        imagePickerView.addGestureRecognizer(tapGesture)
    }
    
  

    //MARK: - 뷰 추가 및 제약

    
    private func addViews() {
        [albumWriteLabel, completeButton, imagePickerView].forEach{ view.addSubview($0)}
    }
    
    private func setConstraints() {
        albumWriteLabelConstraints()
        completeButtonConstraints()
        imagePickerViewConstraints()
        imagePickerbtnConstraints()

    }
    
    private func albumWriteLabelConstraints() {
        albumWriteLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            albumWriteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumWriteLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)])
    }
    
    private func completeButtonConstraints() {
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeButton.centerYAnchor.constraint(equalTo: albumWriteLabel.centerYAnchor),
            completeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            completeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func imagePickerViewConstraints() {
        imagePickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePickerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            imagePickerView.heightAnchor.constraint(equalTo: imagePickerView.widthAnchor, multiplier: 1),
            imagePickerView.topAnchor.constraint(equalTo: albumWriteLabel.bottomAnchor, constant: 30)
        ])
    }
    
    private func imagePickerbtnConstraints() {
        imagePickerbtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePickerbtn.centerXAnchor.constraint(equalTo: imagePickerView.centerXAnchor),
            imagePickerbtn.centerYAnchor.constraint(equalTo: imagePickerView.centerYAnchor),
            imagePickerbtn.heightAnchor.constraint(equalToConstant: 100),
            imagePickerbtn.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
        
    //MARK: - function


    
    @objc fileprivate func imagePickerbtnTapped() {
        var config = YPImagePickerConfiguration()
        config.screens = [.library]
        let picker = YPImagePicker(configuration: config)
        //사진이 선택되었을 때
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                //사진이미지 변경
                self.imagePickerView.image = photo.image
                self.imagePickerbtn.isHidden = true
            }
            //사진 선택창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        //사진 선택창 보여주기
        present(picker, animated: true, completion: nil)
        
    }

}

