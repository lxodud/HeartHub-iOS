//
//  AddPostViewController.swift
//  HeartHub
//
//  Created by 제민우 on 2023/08/16.
//

import UIKit
import PhotosUI

final class AddPostViewController: UIViewController {

    private let addPostView = AddPostView()
    
    private var postCategoryButtonArray: [UIButton] = []
        
    override func loadView() {
        view = addPostView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAddTarget()
        addPostView.configureTapPostImageAction(self, #selector(configureSelectImageAlert))
    }
}

// MARK: Configure ActionSheet
extension AddPostViewController {
    
    @objc private func configureSelectImageAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let library = UIAlertAction(title: "앨범", style: .default) { (action)
            in self.openLibrary()
        }
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
                
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: Configure PHPicker
extension AddPostViewController: PHPickerViewControllerDelegate {
    
    private func openLibrary() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 10
        configuration.filter = .any(of: [.images])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, ErrorPointer) in
                DispatchQueue.main.async {
                    self.addPostView.postImageView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 로딩 실패")
        }
    }
}

// MARK: Configure ImagePicker
extension AddPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func openCamera() {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            let addPostImagePicker = UIImagePickerController()
            
            addPostImagePicker.sourceType = .camera
            addPostImagePicker.delegate = self
            present(addPostImagePicker, animated: true, completion: nil)
        } else {
            print("Camera not available")
        }
    }
}

// MARK: Configure AddTarget
extension AddPostViewController {
    private func configureAddTarget() {
        let dailyButton = addPostView.addPostDailyButton
        let lookButton = addPostView.addPostLookButton
        let dateButton = addPostView.addPostDateButton

        postCategoryButtonArray.append(dailyButton)
        postCategoryButtonArray.append(lookButton)
        postCategoryButtonArray.append(dateButton)
        
        for (index, button) in postCategoryButtonArray.enumerated() {
            button.addTarget(self, action: #selector(didTapPostCategoryButton(_:)), for: .touchUpInside)
            button.tag = index
        }
    }
    
    @objc private func didTapPostCategoryButton(_ sender: UIButton) {
        self.postCategoryButtonArray.forEach {
            if $0.tag == sender.tag {
                $0.isSelected = true
                $0.backgroundColor = $0.isSelected ? .black : .white
            } else {
                $0.isSelected = false
                $0.backgroundColor = .white
            }
        }
    }
}

