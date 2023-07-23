//
//  DimmingView.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/23.
//

import UIKit

final class BlurView: UIView {
    enum BlurState {
        case max
        case zero
        case calculatedValue(CGFloat)
    }
    
    var blurState: BlurState = .zero {
        didSet {
            switch blurState {
            case .max:
                alpha = 1.0
            case .zero:
                alpha = 0.0
            case .calculatedValue(let value):
                alpha = value
            }
        }
    }
    
    init(backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.7)) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
