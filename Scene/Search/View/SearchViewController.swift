//
//  SearchViewController.swift
//  FodFod
//
//  Created by Dogukaim on 20.08.2023.
//

import UIKit

class SearchViewController: UIViewController {

    private var searchViewModel = SearchViewModel()
    
    private var segmentedDishes = [Dish]()
    private var allCategoryDishes = [Dish]()
    
    @IBOutlet weak var searchCollection: UICollectionView!
    @IBOutlet weak var barSearch: UISearchBar!
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSetup()
        getData()
        isSucceded()
    }
    
    
    @IBAction func basketBarTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "BasketViewController") as! BasketViewController
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func didChangeCategoryy(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            
        case 0:
            searchViewModel.getSearchDishes(catID: searchViewModel.searchCategories[sender.selectedSegmentIndex].id ?? "" )
            isSucceded()
            
            
        case 1:
            searchViewModel.getSearchDishes(catID: searchViewModel.searchCategories[sender.selectedSegmentIndex].id ?? "" )
            isSucceded()
            
        case 2:
            searchViewModel.getSearchDishes(catID: searchViewModel.searchCategories[sender.selectedSegmentIndex].id ?? "" )
            isSucceded()
            
        case 3:
            searchViewModel.getSearchDishes(catID: searchViewModel.searchCategories[sender.selectedSegmentIndex].id ?? "")
            isSucceded()
            
        case 4:
            searchViewModel.getSearchDishes(catID: searchViewModel.searchCategories[sender.selectedSegmentIndex].id ?? "" )
            isSucceded()
            
        default:
            return
        }
    }
    
    
    
    private func collectionSetup() {
        searchCollection.register(UINib(nibName: "\(SearchViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SearchViewCell.self)")
    }
    
    
    
    //MARK: Viewmodel Conf
    
    private func getData() {
        searchViewModel.getSearchCategory()
        searchViewModel.getSearchDishes(catID: "cat1")
    }
    
    func isSucceded() {
        searchViewModel.successCallBack = { [weak self ] in
            self?.segmentedDishes = self?.searchViewModel.searchDishes ?? []
            self?.searchCollection.reloadData()
        }
    }
}




extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            searchViewModel.searchDishes = segmentedDishes
            searchCollection.reloadData()
        }else {
            searchViewModel.searchDishes = segmentedDishes.filter { Dish in
                Dish.name!.lowercased().contains(searchText.lowercased())
            }
            searchCollection.reloadData()
        }
    }
}


extension SearchViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return searchViewModel.searchDishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = searchCollection.dequeueReusableCell(withReuseIdentifier: "\(SearchViewCell.self)", for: indexPath) as! SearchViewCell
        cell.configure(data: searchViewModel.searchDishes[indexPath.row])
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailViewController()
        let bundle = Bundle(for: type(of: controller))
        bundle.loadNibNamed("DetailViewController", owner: controller,options: nil)
        self.navigationController?.show(controller, sender: nil)
        controller.getDataForFireBase(data: searchViewModel.searchDishes[indexPath.row])
        controller.configure(data: searchViewModel.searchDishes[indexPath.row])
    }
    
}
