//
//  LocalViewController.swift
//  voter
//
//  Created by Kunwar Sahni on 10/12/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import UIKit
import Firebase

class LocalViewController: UIViewController {

    @IBOutlet weak var curMayorImg: UIImageView!
    @IBOutlet weak var curMayorNm: UILabel!
    @IBOutlet weak var canMayorImg: UIImageView!
    @IBOutlet weak var canMayorm: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curMayorImg.layer.cornerRadius = curMayorImg.frame.width/11.0
        curMayorImg.clipsToBounds = true
        
        Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("1").child("name").observeSingleEvent(of: .value) { (snapshot) in
            guard let name = snapshot.value as? String else {return}
            self.curMayorNm.text = name
        }
        
    }

}
