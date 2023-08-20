//
//  CategoryFoodController.swift
//  FodFod
//
//  Created by Dogukaim on 17.08.2023.
//


import UIKit


class CategoryFoodController: UIViewController {
    
    @IBOutlet private weak var collection: UICollectionView!
    
    private var foodArray = [Dish]()
    
    var categoryLabel: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
    }
    
    
    
    private func collectionSetup() {
        
        collection.register(UINib(nibName: "\(CategoryFoodCollectionViewCell.self)", bundle: nil),forCellWithReuseIdentifier: "\(CategoryFoodCollectionViewCell.self)")
    }
    
    func configure(data: [Dish]) {
        foodArray = data
    }
    
}



extension CategoryFoodController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "\(CategoryFoodCollectionViewCell.self)", for: indexPath) as! CategoryFoodCollectionViewCell
        cell.categoryLabel.text = categoryLabel
        cell.configure(data: foodArray[indexPath.row])
        cell.layer.cornerRadius = 13
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailViewController()
        let bundle = Bundle(for: type(of: controller))
        bundle.loadNibNamed("DetailViewController", owner: controller,options: nil)
        self.navigationController?.show(controller, sender: nil)
        controller.getDataForFireBase(data: foodArray[indexPath.row])
        controller.configure(data: foodArray[indexPath.row])
    }
    
    
}



