//
//  
//  HomeModel.swift
//  FodFod
//
//  Created by Dogukaim on 14.08.2023.
//
//
import Foundation
import Kingfisher

// MARK: - Food
struct Food: Codable {
    let status: Int?
    let message: String?
    let data: DataClass?
}


struct Dishes: Codable {
    let status: Int?
    let message: String?
    let data: [Dish]?
}


// MARK: - DataClass
struct DataClass: Codable {
    let categories: [FoodCategory]?
    let populars, specials: [Dish]?
}




// MARK: - FoodCategory
struct FoodCategory: Codable,CategoryProtocolViewCell {
    
    let id, title: String?
    let image: String?
    
    
    var categoryCellImage: String {
        image ?? ""
    }
    
    var categoryCellLabel: String {
        title ?? ""
    }
}





// MARK: - Dish
struct Dish: Codable,DishesViewCellProtocol,SpecialDishesViewProtocol,CategoryFoodCellProtocol,DetailFoodViewProtocol {
    
    
    
    let id, name, popularDescription, specialsDescription: String?
    let image: String?
    let calories: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case popularDescription, specialsDescription = "description"
        case image, calories
        
    }
    
    
    var dishesCellImages: URL? {
        return URL(string:  image ?? "")
    }
    
    var dishesTitle: String {
        name ?? ""
    }
    
    var dishesDescrption: String {
        if popularDescription != nil {
            return popularDescription ?? ""
        }else if  specialsDescription != nil {
            return specialsDescription ?? ""
        }
        return ""
    }
    
    var dishesCalori: String {
        if let calories = calories {
            return "\(calories)"
        }
        return ""
    }
    
    
        //MARK: SpecialDishesProtocol
    
    var specialImages: URL? {
        return URL(string:  image ?? "")
    }
    
    var specialDes: String {
        if popularDescription != nil {
            return popularDescription ?? ""
        }else if  specialsDescription != nil {
            return specialsDescription ?? ""
        }
        return ""
    }
    
    var specialName: String {
        name ?? ""
    }
    
    var specialCalori: String {
        if let calories = calories {
            return "\(calories)"
        }
        return ""
    }
    
    
    
    //MARK: CategorYFoodP
    
    var categoryFoodImage: String {
        image ?? ""
    }
    
    var categoryTitleLabel: String {
        name ?? ""
    }
    
    var categoryCalorieLabel: String {
        if let calories = calories {
            return "\(calories)"
        }
        return ""
    }
    
    
    //MARK: DetailFoodViewProtocol
    
    var detailImagee: String {
        image ?? ""
    }
    
    var detailTitlee: String {
        name ?? ""
    }
    
    var detailCaloriee: String {
        if let calories = calories {
            return "\(calories)"
        }
        return ""
    }
    
    var detailDescriptionn: String {
        if popularDescription != nil {
            return popularDescription ?? ""
        } else if specialsDescription != nil {
            return specialsDescription ?? ""
        }
        return ""
    }
    
    
}



