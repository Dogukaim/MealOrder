//
//  OnboardingCell.swift
//  FodFod
//
//  Created by Dogukaim on 13.08.2023.
//


import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImage: UIImageView!
    
    @IBOutlet weak var slideDesc: UILabel!
    
    @IBOutlet weak var slideTitle: UILabel!
    
    
    func configure(data: OnboardingModel){
        slideDesc.text = data.descrption
        slideImage.image = data.image
        slideTitle.text = data.title
    }
}
