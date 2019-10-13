//
//  NationalViewController.swift
//  voter
//
//  Created by Kunwar Sahni on 10/12/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import UIKit
import Firebase


class NationalViewController: UIViewController {

    @IBOutlet weak var currentUsPresImg: UIImageView!
    @IBOutlet weak var currentUsPresNm: UILabel!
    @IBOutlet weak var presCandImg: UIImageView!
    @IBOutlet weak var presCandNm: UILabel!
    @IBOutlet weak var currentIndSenImg: UIImageView!
    @IBOutlet weak var currentIndSenNm: UILabel!
    @IBOutlet weak var indSenCandImg: UIImageView!
    @IBOutlet weak var indSenCandNm: UILabel!
    @IBOutlet weak var indRepreImg: UIImageView!
    @IBOutlet weak var indRepreNm: UILabel!
    @IBOutlet weak var indRepCandImg: UIImageView!
    @IBOutlet weak var indRepCandNm: UIImageView!
    
    var sendData: String?
    
    override func viewDidLoad() {
        currentUsPresImg.layer.cornerRadius = currentUsPresImg.frame.width/14.0
        currentUsPresImg.clipsToBounds = true
        presCandImg.layer.cornerRadius = presCandImg.frame.width/14.0
        presCandImg.clipsToBounds = true
        currentIndSenImg.layer.cornerRadius = currentIndSenImg.frame.width/14.0
        currentIndSenImg.clipsToBounds = true
        indSenCandImg.layer.cornerRadius = indSenCandImg.frame.width/14.0
        indSenCandImg.clipsToBounds = true
        indRepreImg.layer.cornerRadius = indRepreImg.frame.width/14.0
        indRepreImg.clipsToBounds = true
        indRepCandImg.layer.cornerRadius = indRepCandImg.frame.width/14.0
        indRepCandImg.clipsToBounds = true
        
        
        Database.database().reference().child("Political Database").child("National").child("President of the United States").child("name").observeSingleEvent(of: .value) { (snapshot) in
            guard let name = snapshot.value as? String else {return}
            self.currentUsPresNm.text = name
        }
        
        Database.database().reference().child("Political Database").child("National").child("US Senator").child("name").observeSingleEvent(of: .value) { (snapshot) in
            guard let name = snapshot.value as? String else {return}
            self.currentIndSenNm.text = name
        }
        
        
        Database.database().reference().child("Political Database").child("National").child("US Representative").child("name").observeSingleEvent(of: .value) { (snapshot) in
            guard let name = snapshot.value as? String else {return}
            self.indRepreNm.text = name
        }
        
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "natToProfile" {
            if let destinationVC = segue.destination as? ProfileViewController {
                destinationVC.recivedData = sendData
            }
        }
    }
    
    @IBAction func currUsPres(_ sender: Any) {
        sendData = "President Donald Trump"
        self.performSegue(withIdentifier: "natToProfile", sender: self)
    
    }
    
    @IBAction func usPresCand(_ sender: Any) {
        sendData = "President Donald Trump"
        self.performSegue(withIdentifier: "natToProfile", sender: self)
    }
    
    @IBAction func curIndSen(_ sender: Any) {
        sendData = "Senator Todd Young"
        self.performSegue(withIdentifier: "natToProfile", sender: self)
    }
    
    @IBAction func indSenCand(_ sender: Any) {
        sendData = "Senator Todd Young"
        self.performSegue(withIdentifier: "natToProfile", sender: self)
    }
    
    @IBAction func currIndRep(_ sender: Any) {
        sendData = "Representative James R. Baird"
        self.performSegue(withIdentifier: "natToProfile", sender: self)
    }
    
    @IBAction func repCand(_ sender: Any) {
        sendData = "Representative James R. Baird"
        self.performSegue(withIdentifier: "natToProfile", sender: self)
    }
    
}
