//
//  SignUpViewController.swift
//  FodFod
//
//  Created by Dogukaim on 18.08.2023.
//


import UIKit
import FirebaseDatabase
import Firebase

class SignUpViewController: UIViewController {
    
    let dataBase = Database.database().reference()
    
    @IBOutlet weak var emailTextt: UITextField!
    @IBOutlet weak var passwordTextt: UITextField!
    @IBOutlet weak var signUPButt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    @IBAction func signUPTappedd(_ sender: Any) {
        if emailTextt.text != nil {
            
            Auth.auth().createUser(withEmail: emailTextt.text!, password: passwordTextt.text!) {
                data, error in
                
                if error != nil {
                    AlertMessage.alertMessage(title: "Error", message: "Fill in the Email part in the appropriate format", vc: self)
                } else {
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "LogInController") as! LoginViewController
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller,animated: true)
                }
            }
        }
    }
    
    private func configureUI() {
        emailTextt.layer.cornerRadius = 13
        passwordTextt.layer.cornerRadius = 13
        signUPButt.layer.cornerRadius = 20
    }
}
