//
//  PasswordChangeViewController.swift
//  HeartHub
//
//  Created by 전제윤 on 2023/08/19.
//

import UIKit
import SwiftUI

struct PasswordChangeView_preview: UIViewControllerRepresentable {
    typealias UIViewControllerType = PasswordChangeViewController
    
    func makeUIViewController(context: Context) -> PasswordChangeViewController {
        return PasswordChangeViewController()
    }

    func updateUIViewController(_ uiViewController: PasswordChangeViewController, context: Context) {
    }
    
}

@available(iOS 13.0.0, *)
struct PasswordChangeView_ViewPreview: PreviewProvider {
    static var previews: some View {
        PasswordChangeView_preview()
    }
}

class PasswordChangeViewController: UIViewController {
    
    private let passwordChangeView = PasswordChangeView()
    
    override func loadView() {
        view = passwordChangeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}



