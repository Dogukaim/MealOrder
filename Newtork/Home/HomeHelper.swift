//
//  HomeHelper.swift
//  FodFod
//
//  Created by Dogukaim on 15.08.2023.
//


import Foundation



enum HomeEndpoint {
    case fetchAllCategories
    case fetchCategoryDishes(String)
    
    var path: String {
        switch self {
        case .fetchAllCategories:
            return NetworkHelper.shared.requestUrl(url: "/dish-categories")
        case .fetchCategoryDishes(let catID):
            return NetworkHelper.shared.requestUrl(url: "/dishes/\(catID)")
        }
    }
}



