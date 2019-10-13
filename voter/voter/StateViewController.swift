//
//  StateViewController.swift
//  voter
//
//  Created by Kunwar Sahni on 10/12/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import UIKit
import Firebase

var sendData: String?

class StateViewController: UIViewController {

    @IBOutlet weak var currIndGovImg: UIImageView!
    @IBOutlet weak var currIndGovNm: UILabel!
    @IBOutlet weak var indGovCandImg: UIImageView!
    @IBOutlet weak var indGovCandNm: UILabel!
    @IBOutlet weak var currIndRepImg: UIImageView!
    @IBOutlet weak var currIndRepNm: UILabel!
    @IBOutlet weak var indRedCandNm: UILabel!
    
    override func viewDidLoad() {
        currIndGovImg.layer.cornerRadius = currIndGovImg.frame.width/14.0
        currIndGovImg.clipsToBounds = true
        indGovCandImg.layer.cornerRadius = indGovCandImg.frame.width/14.0
        indGovCandImg.clipsToBounds = true
        currIndRepImg.layer.cornerRadius = currIndRepImg.frame.width/14.0
        currIndRepImg.clipsToBounds = true

        Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("0").child("name").observeSingleEvent(of: .value) { (snapshot) in
            guard let name = snapshot.value as? String else {return}
            self.currIndGovNm.text = name
        }
        
        Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("1").child("name").observeSingleEvent(of: .value) { (snapshot) in
            guard let name = snapshot.value as? String else {return}
            self.indGovCandNm.text = name
        }
        
        
        Database.database().reference().child("Political Database").child("State").child("IN State Representative").child("name").observeSingleEvent(of: .value) { (snapshot) in
            guard let name = snapshot.value as? String else {return}
            self.currIndRepNm.text = name
        }
        
        
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stateToProfile" {
            if let destinationVC = segue.destination as? ProfileViewController {
                destinationVC.recivedData = sendData
            }
        }
    }
    
    @IBAction func currIndGov(_ sender: Any) {
        sendData = "Eric Holcomb"
        self.performSegue(withIdentifier: "stateToProfile", sender: self)
    }
    
    @IBAction func indGovCand(_ sender: Any) {
        sendData = "Eddie Melton"
        self.performSegue(withIdentifier: "stateToProfile", sender: self)
    }
    
    @IBAction func curIndRep(_ sender: Any) {
        sendData = "Ronald Bacon"
        self.performSegue(withIdentifier: "stateToProfile", sender: self)
    }
    
}
