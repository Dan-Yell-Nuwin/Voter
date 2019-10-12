//
//  SignUpViewController.swift
//  voter
//
//  Created by Kunwar Sahni on 10/12/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var signEmail: UITextField!
    @IBOutlet weak var signPassword: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var county: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        guard let emailText = signEmail.text else {return}
        guard let passwordText = signPassword.text else {return}
        guard let adressText = address.text else {return}
        guard let countyText = county.text else {return}
        createUser(withEmail: emailText, password: passwordText, address: adressText, county: countyText)
    }
    
    
    func createUser(withEmail email: String, password: String, address: String, county: String){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error{
                print("Failed to sign up user with error")
                return
            }
            
            guard let uid = result?.user.uid else {
                return
            }
            
            let values = ["email": email, "address": address, "county": county]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Failed to update databse with errors:", error.localizedDescription)
                    return
                }
                
                print("Succesfuly Signed User up")
                //Send user Home
               self.performSegue(withIdentifier: "signToHome", sender: nil)
                
            })
            
        }
        
    }
    
}
