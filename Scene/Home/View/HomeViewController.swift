//
//  
//  HomeViewController.swift
//  FodFod
//
//  Created by Dogukaim on 14.08.2023.
//
//
import UIKit

class HomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollection: UICollectionView!
    
    
    @IBOutlet weak var chefSpecials: UICollectionView!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        isSucced()
        collectionSetup()
    }
    

    func collectionSetup() {
        categoryCollectionView.register(UINib(nibName: "\(CategoryCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CategoryCollectionViewCell.self)")
        popularCollection.register(UINib(nibName: "\(DishesCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(DishesCollectionViewCell.self)")
        chefSpecials.register(UINib(nibName: "\(SpecialDishesViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SpecialDishesViewCell.self)")
    }
    
    
    func getData() {
        viewModel.getCategoryData()
        viewModel.getPopulerDishesColl()
        viewModel.getSpecialDishes()
    }
    
    
    func isSucced() {
        viewModel.successCallback = { [weak self] in
            self?.categoryCollectionView.reloadData()
            self?.popularCollection.reloadData()
            self?.chefSpecials.reloadData()
            
        }
    }
    
}


extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return viewModel.allCategories.count
    
        case popularCollection:
            return viewModel.popularDishes.count
        
        case chefSpecials:
            return viewModel.specialDishes.count
        
        default:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryCollectionViewCell.self)", for: indexPath) as! CategoryCollectionViewCell
            cell.configure(data: viewModel.allCategories[indexPath.row])
            return cell
        case popularCollection:
            let cell = popularCollection.dequeueReusableCell(withReuseIdentifier: "\(DishesCollectionViewCell.self)", for: indexPath) as! DishesCollectionViewCell
            cell.configure(data: viewModel.popularDishes[indexPath.row])
            return cell
        case chefSpecials:
            let cell = chefSpecials.dequeueReusableCell(withReuseIdentifier: "\(SpecialDishesViewCell.self)", for: indexPath) as! SpecialDishesViewCell
            cell.configure(data: viewModel.specialDishes[indexPath.row])
            return cell
    
        default:
            return UICollectionViewCell()
        }
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//           return CGSizeMake(view.frame.size.width/3.8, view.frame.size.width/3.8)
//       }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        
        case categoryCollectionView:
            let catID = viewModel.allCategories[indexPath.row].id ?? ""
            viewModel.getCategoryDishes(catID: catID)
            viewModel.successCallback = { [weak self] in
                let controller = self?.storyboard?.instantiateViewController(withIdentifier: "CategoryFoodController") as! CategoryFoodController
                controller.categoryLabel = self?.viewModel.allCategories[indexPath.row].title
                controller.configure(data: (self?.viewModel.categoryDishes)!)
                self?.navigationController?.pushViewController(controller, animated: true)
            }
        
        
            
            
        default:
            return print("Did not show next VC")
        }
    }
    
}
