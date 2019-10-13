//
//  ProfileViewController.swift
//  voter
//
//  Created by Kunwar Sahni on 10/12/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    var recivedData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(recivedData == "President Donald Trump"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "President of the United States"
                
            }
        }else if(recivedData == "Senator Todd Young"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "US Senator Indiana"

            }
        }else if (recivedData == "Representative James R. Baird"){
            Database.database().reference().child("Political Database").child("National").child("US Representative").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "US Representative Indiana"
                
            }
            
        }else if(recivedData == "John R Dennis"){
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("1").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "Mayor of West Lafayette"
                
            }
        }else if(recivedData == "Zachary Baiel"){
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("0").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "Candidate for Mayor of West Lafayette"
                
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "profileToHome", sender: nil)
    }
    
    
    
}
