//
//  ProfileController.swift
//  FodFod
//
//  Created by Dogukaim on 20.08.2023.
//

import Foundation
import UIKit
import Firebase


class ProfileController: UIViewController {
        
    let profileViewModel = ProfileViewModel()
    
    @IBOutlet weak var profileTable: UITableView!
    @IBOutlet weak var signOutBut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        profileViewModel.delegate = self
        profileViewModel.fetchUser()
        signOutBut.layer.cornerRadius = 15
        profileTable.separatorStyle = .none
    }
    

    @IBAction func signOutButton(_ sender: UIButton) {
        profileViewModel.signout()
        gologinScreen()
    }
    
    private func tableViewSetup() {
        profileTable.register(UINib(nibName: "\(ProfileTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(ProfileTableViewCell.self)")
    }
    
    
    private func gologinScreen() {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        controller.modalPresentationStyle = .fullScreen
        self.present(controller,animated: true)
    }
    
}

    

extension ProfileController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = profileTable.dequeueReusableCell(withIdentifier: "\(ProfileTableViewCell.self)") as! ProfileTableViewCell
        cell.configure(data: profileViewModel.email!)
        return cell 
    }
    
    
}



extension ProfileController: ProfileViewModelDelegate {
    func errorDidOccur(error: Error) {
        print(error.localizedDescription)
    }
    
    func didSignOutSuccessfull() {
        
    }
    
    
}
