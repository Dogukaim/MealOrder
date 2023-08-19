//
//  CategoryFoodCollectionViewCell.swift
//  FodFod
//
//  Created by Dogukaim on 17.08.2023.
//

import UIKit
import Kingfisher


protocol CategoryFoodCellProtocol {
    var categoryFoodImage: String { get }
    var categoryTitleLabel: String { get }
    var categoryCalorieLabel: String { get }
    
}


class CategoryFoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriLabell: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func configure(data: CategoryFoodCellProtocol ) {
        foodImage.kf.setImage(with: URL(string: data.categoryFoodImage))
        titleLabel.text = data.categoryTitleLabel
        caloriLabell.text = "∆\(data.categoryCalorieLabel) kcal"
    }
}

