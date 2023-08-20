//
//  BasketViewModel.swift
//  FodFod
//
//  Created by Dogukaim on 20.08.2023.
//

import UIKit
import Firebase
import FirebaseDatabase


class BasketViewModel {
    
    let dataBase = Database.database().reference()
    let currentUser = Auth.auth().currentUser
    var foods = [BasketDataModel]()
    
    var errorCallBack: ((String)->())?
    var successCallBack: (()-> ())?
    
    
    //MARK: Get Data From Firebase
    
    func getDataFromFirebase() {
        let uid = Auth.auth().currentUser?.uid
        
        dataBase.child("Users").child(uid!).observeSingleEvent(of: .value) { (snapshot: DataSnapshot?) in
            if let data = snapshot?.children.allObjects as? [DataSnapshot] {
                self.foods.removeAll()
                
                for snap in data {
                    
                    if let postDic = snap.value as? Dictionary<String, Any> {
                        
                        let name = postDic["name"]!
                        let image = postDic["image"]!
                        let description = postDic["description"]!
                        let calories = "\(postDic["calories"]!)"
                        let quantity = postDic["quantity"]
                        self.foods.append(BasketDataModel(name: name as? String, image: image as? String, calories: calories , description: description as? String, quantity: quantity as? String))
                    }
                }
                
                self.successCallBack?()
            }
        }
    }
    
    //MARK: Firebase Update
    func updateFirebaseData() {
        dataBase.child("Users").child(currentUser?.uid ?? "" ).removeValue()
        self.successCallBack?()
    }
    
    
    //MARK: Total Cost
    
    var totalCost: Int {
        var total: Int = 0
        if foods.count == 0 {
            return total
        } else {
            for e in 0...foods.count - 1 {
                total += (Int(foods[e].quantity!))!
            }
            return total
        }
    }
    
}
