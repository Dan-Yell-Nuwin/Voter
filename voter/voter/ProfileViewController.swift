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
            
        }else if (recivedData == "Representative James R. Baird"){
            
        }
    }
    
    
    
}
