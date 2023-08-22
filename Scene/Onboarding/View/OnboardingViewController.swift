//
//  
//  OnboardingViewController.swift
//  FodFod
//
//  Created by Dogukaim on 13.08.2023.
//
//
import UIKit


class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var nextBut: UIButton!
    
    @IBOutlet weak var skipBut: UIButton!
    
    @IBOutlet weak var pageCont: UIPageControl!
    
    
    var slides: [OnboardingModel] = []
    
    var currentpage = 0 {
        didSet {
            pageCont.currentPage = currentpage
            if currentpage == slides.count - 1 {
                nextBut.setTitle("Get Started", for: .normal)
            } else {
                nextBut.setTitle("Next", for: .normal)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        slides = [
            OnboardingModel(title: "World-Class Chefs", image: #imageLiteral(resourceName: "Onboarding1"), descrption: "Our dishes are prepared by only the best."),
            OnboardingModel(title: "Instant World-Wide Delivery", image: #imageLiteral(resourceName: "Onboarding2"), descrption: "Your orders will be delivered instantly irrespective of your location around the world.")
                ]
        
        pageCont.numberOfPages = slides.count
    }
    
    @IBAction func nextButtonTic(_ sender: UIButton) {
        
        if currentpage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller,animated: true,completion: nil)
        } else {
            currentpage += 1
            let indexPath = IndexPath(item: currentpage, section: 0)
            collection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
    @IBAction func skipButtonTic(_ sender: UIButton) {
        let controler = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        controler.modalPresentationStyle = .fullScreen
        controler.modalTransitionStyle = .coverVertical
        present(controler,animated: true,completion: nil)
    }
}


extension OnboardingViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        cell.configure(data: slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentpage = Int(scrollView.contentOffset.x / width)
        
    }
}
