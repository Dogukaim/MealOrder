//
//  
//  HomeViewModel.swift
//  FodFod
//
//  Created by Dogukaim on 14.08.2023.
//
//
import Foundation

class HomeViewModel {
    
    let manager = HomeManager.shared
    
    var allCategories = [FoodCategory]()
    var popularDishes = [Dish]()
    var specialDishes = [Dish]()
    var categoryDishes = [Dish]()
    var successCallback: (()->())?

    
    func getCategoryData(){
        
        manager.getCategoryFoods(type: .fetchAllCategories) { food in
            if let food = food {
                self.allCategories = food.data?.categories ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("Error while getting Category Data\(error)")
        }
    }
    
    
    func getPopulerDishesColl() {
        
        manager.getCategoryFoods(type: .fetchAllCategories) { food in
            if let food = food {
                self.popularDishes = food.data?.populars ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("Error while getting CategoryDishes Data\(error)")
        }
    }
    
    
    func getSpecialDishes() {
        manager.getCategoryFoods(type: .fetchAllCategories) { food in
            if let food = food {
                self.specialDishes = food.data?.specials ?? []
                self.successCallback?()
            }
        }onError: { error in
            print("Error while getting CategoryDishes Data\(error)")
        }
    }
    
    
    func getCategoryDishes(catID: String) {
        manager.getDetailDishes(type: .fetchCategoryDishes(catID)) { food in
            if let food = food {
                self.categoryDishes = food.data ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("Error while getting CategoryDishes Data\(error)")
        }

    }
}

