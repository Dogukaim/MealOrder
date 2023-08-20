//
//  ProfileTableViewCell.swift
//  FodFod
//
//  Created by Dogukaim on 20.08.2023.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var emailLabel: UILabel!
    
    func configure(data: String) {
        emailLabel.text = data
    }
    
}
