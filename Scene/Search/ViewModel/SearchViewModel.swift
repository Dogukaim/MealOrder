//
//  SearchViewModel.swift
//  FodFod
//
//  Created by Dogukaim on 20.08.2023.
//

import Foundation


class SearchViewModel {
    
    let manager = HomeManager.shared
    
    var searchCategories = [FoodCategory]()
    var searchDishes = [Dish]()
    
    var errorCallBack: ((String)-> ())?
    var successCallBack: (()->())?
    
    
    
    func getSearchCategory() {
        manager.getCategoryFoods(type: .fetchAllCategories) { food in
            if let food = food {
                self.searchCategories = food.data?.categories ?? []
                self.successCallBack?()
            }
        } onError: { error in
            print("Error while getting category Data\(error)")
        }

    }
    
    //MARK: Getting Food for Search Scene
    
    func getSearchDishes(catID: String) {
        manager.getDetailDishes(type: .fetchCategoryDishes(catID)) { food in
            if let food = food {
                self.searchDishes = food.data ?? []
                self.successCallBack?()
            }
        } onError: { error in
            print("Error While getting food for Search scene. ")
        }

    }
}
