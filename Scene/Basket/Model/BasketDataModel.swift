//
//  DataModel.swift
//  FodFod
//
//  Created by Dogukaim on 19.08.2023.
//

import Foundation

struct BasketDataModel: BasketCollViewProtocol {
    
    
    let name: String?
    let image: String?
    let calories: String?
    let description: String?
    let quantity: String?
    
    
    
    //MARK: BasketCollViewProtocol
    
    var basketQuantityLbl: String {
        quantity ?? ""
    }
    
    var basketTitleLbl: String {
        name ?? ""
    }
    
    var basketImage: String {
        image ?? ""
    }
    
    var basketDescriptionLbl: String {
        description ?? ""
    }
    
    var basketCaloriLbl: String {
        calories ?? ""
    }
    
    
}
