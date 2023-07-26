//
//  PanModalPresentable.swift
//  HeartHub
//
//  Created by 이태영 on 2023/07/26.
//

import UIKit

protocol PanModalPresentable {
    var scrollView: UIScrollView? { get }
    var stickyView: UIView? { get }
}
