//
//  LogInViewController.swift
//  voter
//
//  Created by Kunwar Sahni on 10/12/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet weak var logInEmail: UITextField!
    @IBOutlet weak var logInPassword: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func logInTapped(_ sender: Any) {
        guard let emailText = logInEmail.text else {return}
        guard let passwordText = logInPassword.text else {return}
        logUserIn(withEmail: emailText, password: passwordText)
    }
   
    func logUserIn(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error{
                print("Failed to Log In user with error")
                return
            }
            print("Succesfully Log In User")
            self.performSegue(withIdentifier: "logInToHome", sender: nil)
        }
    }
    
}
