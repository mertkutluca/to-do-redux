//
//  UIView.swift
//  TO-DO_v2
//
//  Created by mert.kutluca on 28.06.2022.
//

import UIKit

extension UIView {

    func addBorder(_ width: CGFloat = 1, cornerRadius: CGFloat = 6, color: UIColor = .lightGray) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.cornerRadius = cornerRadius
    }
    
}
