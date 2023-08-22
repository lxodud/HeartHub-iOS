//
//  RrofileResetViewController.swift
//  HeartHub
//
//  Created by 전제윤 on 2023/08/19.
//

import UIKit

final class ProfileResetViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    private let profileResetView = ProfileResetView()
    
    override func loadView() {
        view = profileResetView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        profileResetView.cameraButton.addTarget(self, action: #selector(showImagePicker), for: .touchUpInside)
        profileResetView.profileSetbtn.addTarget(self, action: #selector(didTapProfileSetButton), for: .touchUpInside)
    }
    
    
    @objc private func showImagePicker() {
        print("이미지피커 동작")
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "카메라", style: .default) { _ in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }
        alertController.addAction(cameraAction)
        
        let albumAction = UIAlertAction(title: "앨범", style: .default) { _ in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
        alertController.addAction(albumAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc private func didTapProfileSetButton() {
        let myPageDoneProfileSetViewController = MyPageDoneProfileSetViewController()
        modalPresentationStyle = .overFullScreen
        present(myPageDoneProfileSetViewController, animated: true)
    }
}
