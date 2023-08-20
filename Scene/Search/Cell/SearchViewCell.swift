//
//  SearchViewCell.swift
//  FodFod
//
//  Created by Dogukaim on 20.08.2023.
//

import UIKit
import Kingfisher
import FirebaseDatabase
import Firebase


protocol SearchViewCellProtocol {
    var searchCellIMage: String { get }
    var searchTitleLabel: String { get }
    var searchCaloriLabel: String { get }
    var searchDescriptionLabel: String { get }
}

class SearchViewCell: UICollectionViewCell {
    
    private let database = Database.database().reference()
    private let currentUser = Auth.auth().currentUser
    
    var items: Dish?
    
    @IBOutlet weak var descSea: UILabel!
    @IBOutlet weak var imageTis: UIImageView!
    @IBOutlet weak var searchTitl: UILabel!
    @IBOutlet weak var caloriSea: UILabel!
    
    
    
    func configure(data: SearchViewCellProtocol) {
        imageTis.kf.setImage(with: URL(string: data.searchCellIMage))
        searchTitl.text = data.searchTitleLabel
        descSea.text = data.searchDescriptionLabel
        caloriSea.text = "∆\(data.searchCaloriLabel) kcal"
        imageTis.layer.cornerRadius = 10
    }
}

