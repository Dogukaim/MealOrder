//
//  LoginViewController.swift
//  FodFod
//
//  Created by Dogukaim on 17.08.2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginBut: UIButton!
    @IBOutlet weak var signUPBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        if emailText.text != nil && passwordText.text != nil {
            self.showHud(show: true)
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) {
                data, error in
                if error != nil {
                    AlertMessage.alertMessage(title: "Error", message: "Email or password is incorrect", vc: self)
                    
                } else {
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeNNC") as! UITabBarController
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller,animated: true,completion: nil)
                    
                }
            }
        }
    }
    
    @IBAction func signUPButtonTapped(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SignUpController") as! SignUpViewController
        self.present(controller,animated: true)
    }
    
    private func configureUI() {
        loginBut.layer.cornerRadius = 18
        signUPBut.layer.cornerRadius = 18
        emailText.layer.cornerRadius = 13
        passwordText.layer.cornerRadius = 13
    }
    
}
