//
//  RootViewController.swift
//  voter
//
//  Created by Kunwar Sahni on 10/12/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import UIKit
import Firebase

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUserAndConfigureView()
    }
    
    func authenticateUserAndConfigureView(){
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async{
                self.performSegue(withIdentifier: "rootToLogIn", sender: nil)
            }
        } else{
            //Prefrom Segue to Home
            print("User is already Loged In")
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "fromRootToHome", sender: nil)
            }
            
        }
    }


}
