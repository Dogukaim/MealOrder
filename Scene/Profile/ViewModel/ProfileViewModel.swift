//
//  ProfileViewModel.swift
//  FodFod
//
//  Created by Dogukaim on 20.08.2023.
//

import Foundation
import Firebase

protocol ProfileViewModelDelegate: AnyObject{
    func errorDidOccur(error: Error)
    func didSignOutSuccessfull()
}

class ProfileViewModel {
    
    weak var delegate: ProfileViewModelDelegate?
    
    let currentUser = Auth.auth().currentUser
    
    var username: String?
    var email: String?
    
    func fetchUser() {
        if let currentUser {
            username = currentUser.displayName
            email  = currentUser.email
        }
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
            delegate?.didSignOutSuccessfull()
        }catch {
            delegate?.errorDidOccur(error: error)
        }
    }
}
