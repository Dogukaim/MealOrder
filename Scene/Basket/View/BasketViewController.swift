//
//  BasketViewController.swift
//  FodFod
//
//  Created by Dogukaim on 19.08.2023.
//

import UIKit
import PanModal

class BasketViewController: UIViewController {

    
    @IBOutlet weak var basketCollection: UICollectionView!
    @IBOutlet weak var payView: UIView!
    @IBOutlet weak var checkoutButtonn: UIButton!
    @IBOutlet weak var cartTotalLbl: UILabel!
    
    private var isSelected: Bool = true
    
    private var basketViewModel = BasketViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
        basketViewModel.getDataFromFirebase()
        isSucceded()
        configureUI()
        
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidLoad()
    }
    
    private func configureUI() {
        payView.layer.cornerRadius = 25
        checkoutButtonn.layer.cornerRadius = 10
    }
    
    
    
    @IBAction func checkOutButTapps(_ sender: UIButton) {
        basketViewModel.updateFirebaseData()
        basketViewModel.getDataFromFirebase()
        isSucceded()
        if basketViewModel.foods.count > 0 {
            AlertMessage.alertMessage(title: "Your Order has been taken!", message: "", vc: self)
        } else {
            AlertMessage.alertMessage(title: "Your cart is empty.", message: "Please add items to your cart.", vc: self)
        }
        
    }
    
    
    private func collectionSetup() {
        basketCollection.register(UINib(nibName: "\(BasketCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(BasketCollectionViewCell.self)")
    }
    
    
    //MARK: ViewModel Con
    private func isSucceded() {
        self.basketViewModel.successCallBack = { [weak self ] in
            self?.basketCollection.reloadData()
            self?.cartTotalLbl.text = "\(self?.basketViewModel.totalCost ?? 0) Items"
        }
    }
    
}


extension BasketViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return basketViewModel.foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = basketCollection.dequeueReusableCell(withReuseIdentifier: "\(BasketCollectionViewCell.self)", for: indexPath) as! BasketCollectionViewCell
        cell.getDataFromFirebase(data: basketViewModel.foods[indexPath.row])
        cell.configure(data: basketViewModel.foods[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.delegate = self
        return cell
    }
    
    
    
}
    //MARK: BasketSubClass

extension BasketViewController: BasketColViewCellSubClassDelegate {
    func stepperValueDidChange(cell: BasketCollectionViewCell, stepper: UIStepper) {
        guard let indexPath = self.basketCollection.indexPath(for: cell) else {
            return
        }
        
        if stepper.value == 0 {
            basketViewModel.getDataFromFirebase()
            isSucceded()
            basketViewModel.foods.remove(at: indexPath.row)
            basketCollection.deleteItems(at: [indexPath])
        } else {
            basketViewModel.getDataFromFirebase()
            isSucceded()
        }
    }
    
    
}


        //MARK: Panmodal Present
extension BasketViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(530)
    }
    
    var longFormHeight: PanModalHeight{
        return .maxHeightWithTopInset(300)
    }
}
