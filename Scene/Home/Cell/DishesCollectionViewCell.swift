//
//  DishesCollectionViewCell.swift
//  FodFod
//
//  Created by Dogukaim on 15.08.2023.
//

import UIKit
import Kingfisher

protocol DishesViewCellProtocol{
    var dishesCellImages: URL? { get }
    var dishesTitle: String { get }
    var dishesDescrption: String { get }
    var dishesCalori: String { get }
}


class DishesCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var dishesCellImage: UIImageView!
    @IBOutlet weak var dishesCellTitle: UILabel!
    @IBOutlet weak var dishesCellDescrption: UILabel!
    @IBOutlet weak var dishesCellCalori: UILabel!
    
    
    func configure(data: DishesViewCellProtocol) {
        dishesCellImage.kf.setImage(with: (data.dishesCellImages))
        dishesCellTitle.text = data.dishesTitle
        dishesCellCalori.text = "∆\(data.dishesCalori) kcal"
        dishesCellDescrption.text = data.dishesDescrption
    }
    
}
