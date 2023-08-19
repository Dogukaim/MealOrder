//
//  CategoryCollectionViewCell.swift
//  FodFod
//
//  Created by Dogukaim on 14.08.2023.
//

import UIKit
import Kingfisher


protocol CategoryProtocolViewCell {
    var categoryCellImage: String { get }
    var categoryCellLabel: String { get }
}


class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    func configure(data: CategoryProtocolViewCell){
        categoryTitleLabel.text = data.categoryCellLabel
        categoryImageView.kf.setImage(with: URL(string: data.categoryCellImage))
    }
    
}
