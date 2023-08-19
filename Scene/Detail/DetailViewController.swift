//
//  DetailViewController.swift
//  FodFod
//
//  Created by Dogukaim on 19.08.2023.
//

import UIKit
import Kingfisher
import FirebaseDatabase
import Firebase
import PanModal


class DetailViewController: UIViewController {

    private let database = Database.database().reference()
    private let currentUser = Auth.auth().currentUser
    
    
    var items: Dish?
    var isSelected: Bool = true
    
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var titleLabelF: UILabel!
    @IBOutlet weak var caloriLabelF: UILabel!
    @IBOutlet weak var descriptionLabelF: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var addButtonF: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    @IBAction func stepperTapped(_ sender: Any) {
        
        quantityLabel.text = String(Int(stepper.value))
        
        switch stepper.value {
        case 0:
            database.child("Users").child(currentUser?.uid ?? "").child(items?.name ?? "").removeValue() {
                error, data in
                if error != nil {
                    AlertMessage.alertMessage(title: "Error occurred while removing product from cart", message: "", vc: self)
                } else {
                    AlertMessage.alertMessage(title: "The product has been successfully removed from the cart", message: "", vc: self)
                    self.stepperCustom()
                }
                
            }
        
        case 0...10:
            
        case 11..<100:
            
        default:
            return
        }
        
    }
    
    private func stepperCustom() {
        stepper.value = 1
        quantityLabel.text = String(Int(stepper.value))
    }
    
    
    private func isHiddenUI(bool: Bool) {
        quantityLabel.isHidden = bool
        stepper.isHidden = bool
    }
    
    private func configureAddButton() {
        
        if isSelected {
            isSelected = false
            addButtonF.setTitle("Added to Cart", for: .normal)
            addButtonF.tintColor = UIColor(red: 0.00, green: 0.55, blue: 0.01, alpha: 1.00)
            addButtonF.layer.cornerRadius = 15
            
            
            stepperCustom()
            isHiddenUI(bool: isSelected)
            AlertMessage.alertMessage(title: "The Product added to cart.", message: "", vc: self)
        } else {
            isSelected = true
            addButtonF.setTitle("Add to Cart", for: .normal)
            addButtonF.backgroundColor = UIColor(red: 0.45, green: 0.14, blue: 0.40, alpha: 1.00)
            
        }
    }
    
    
}
