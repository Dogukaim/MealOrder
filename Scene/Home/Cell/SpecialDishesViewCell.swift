//
//  SpecialDishesViewCell.swift
//  FodFod
//
//  Created by Dogukaim on 15.08.2023.
//

import UIKit
import Kingfisher

protocol SpecialDishesViewProtocol {
    var specialImages: URL? { get }
    var specialDes: String { get }
    var specialName: String { get }
    var specialCalori: String { get }
}


class SpecialDishesViewCell: UICollectionViewCell {

    @IBOutlet weak var SpecialImage: UIImageView!
    @IBOutlet weak var specialDescrption: UILabel!
    @IBOutlet weak var specialTitle: UILabel!
    @IBOutlet weak var specialCalori: UILabel!
    
    
    func configure(data: SpecialDishesViewProtocol) {
        SpecialImage.kf.setImage(with: ( data.specialImages!))
        specialTitle.text = data.specialName
        specialCalori.text = "∆ \(data.specialCalori) kcal"
        specialDescrption.text = data.specialDes
    }
}

