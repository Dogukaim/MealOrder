//
//  JGProgressHud+Ext.swift
//  FodFod
//
//  Created by Dogukaim on 22.08.2023.
//

import Foundation
import JGProgressHUD

extension UIViewController {
    
    func showHud(show: Bool) {
        view.endEditing(true)
        let jgProgressHud = JGProgressHUD(style: .light)
        jgProgressHud.textLabel.text = "Loading"
        jgProgressHud.detailTextLabel.text = "Please Wait"
        if show {
            jgProgressHud.show(in: view)
        }else {
            jgProgressHud.dismiss(animated: true)
        }
    }
}

