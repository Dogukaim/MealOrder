//
//  HomeManager.swift
//  FodFod
//
//  Created by Dogukaim on 15.08.2023.
//

import Foundation
import Alamofire


protocol HomeManagerProtocol {
    func getCategoryFoods(type: HomeEndpoint, onSuccess: @escaping(Food?) -> (), onError: @escaping(AFError) -> ())
    func getDetailDishes(type: HomeEndpoint, onSuccess: @escaping(Dishes?) -> (), onError: @escaping(AFError) -> ())
}

class HomeManager: HomeManagerProtocol {
    

    
    static let shared = HomeManager()

    func getCategoryFoods(type: HomeEndpoint, onSuccess: @escaping(Food?) -> (), onError: @escaping (AFError) -> ()) {
            
        var url = ""
        
        switch type{
            
        case .fetchAllCategories:
            url = HomeEndpoint.fetchAllCategories.path
        case .fetchCategoryDishes(let catID):
            url = HomeEndpoint.fetchCategoryDishes(catID).path
        }
        
        NetworkManager.shared.request(path: url) { (response: Food) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
        
    }
    
    
    func getDetailDishes(type: HomeEndpoint, onSuccess: @escaping (Dishes?) -> (), onError: @escaping (AFError) -> ()) {
        var url = ""
        
        switch type {
            
        case .fetchAllCategories:
            url = HomeEndpoint.fetchAllCategories.path
        case .fetchCategoryDishes(let catID):
            url = HomeEndpoint.fetchCategoryDishes(catID).path
        }
        
        NetworkManager.shared.request(path: url) { (response: Dishes) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}

