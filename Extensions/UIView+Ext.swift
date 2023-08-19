//
//  UIView+Ext.swift
//  FodFod
//
//  Created by Dogukaim on 13.08.2023.
//


import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}



