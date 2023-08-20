//
//  BasketCollectionViewCell.swift
//  FodFod
//
//  Created by Dogukaim on 20.08.2023.
//

import UIKit
import Kingfisher
import FirebaseDatabase
import Firebase



protocol BasketColViewCellSubClassDelegate: AnyObject {
    func stepperValueDidChange(cell: BasketCollectionViewCell, stepper: UIStepper)
}


protocol BasketCollViewProtocol {
    var basketQuantityLbl: String { get }
    var basketTitleLbl: String { get }
    var basketImage: String { get }
    var basketDescriptionLbl: String { get }
    var basketCaloriLbl: String { get }
}


class BasketCollectionViewCell: UICollectionViewCell {
    
    var dataFirebasket: BasketDataModel?
    
    private var dataBase = Database.database().reference()
    private var currentUser = Auth.auth().currentUser
    
    weak var delegate : BasketColViewCellSubClassDelegate?
    
    private var stepperValueChanged: Bool = true
    
    
    
    @IBOutlet weak var imageBas: UIImageView!
    @IBOutlet weak var titleBas: UILabel!
    @IBOutlet weak var caloriBas: UILabel!
    @IBOutlet weak var descriptionBas: UILabel!
    @IBOutlet weak var quantityBas: UILabel!
    @IBOutlet weak var stepperBas: UIStepper!

    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
    }
    
    
    
    
    @IBAction func stepperTapBas(_ sender: UIStepper) {
        quantityBas.text = String(Int(stepperBas.value))
        self.delegate?.stepperValueDidChange(cell: self, stepper: stepperBas)
        
        switch stepperBas.value {
            
        case 0:
            dataBase.child("Users").child(currentUser?.uid ?? "" ).child(dataFirebasket?.name ?? "" ).removeValue()
        
        case 0...10:
            dataBase.child("Users").child(currentUser?.uid ?? "" ).child(dataFirebasket?.name ?? "" ).updateChildValues(["quantity" : quantityBas.text ?? "" ])
        
        case 11..<111:
            stepperBas.value = 10
            self.quantityBas.text = String(Int(stepperBas.value))
            
        default:
            return
        }
    }
    
    
    func getDataFromFirebase(data: BasketDataModel) {
        dataFirebasket = data
    }
    
    
    func configure(data: BasketCollViewProtocol) {
        imageBas.kf.setImage(with: URL(string: data.basketImage))
        titleBas.text = data.basketTitleLbl
        quantityBas.text = data.basketQuantityLbl
        descriptionBas.text = data.basketDescriptionLbl
        caloriBas.text = "∆\(data.basketCaloriLbl) kcal"
        stepperBas.value = Double(quantityBas.text ?? "")!
        imageBas.layer.cornerRadius = 10
    }
}
