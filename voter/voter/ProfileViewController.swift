//
//  ProfileViewController.swift
//  voter
//
//  Created by Kunwar Sahni on 10/12/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher


class ProfileViewController: UIViewController {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var bioText: UILabel!
    
    var recivedData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(recivedData == "President Donald Trump"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "President of the United States"
            }
            
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
        }else if(recivedData == "Senator Todd Young"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "US Senator Indiana"

            }
            
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
        }else if (recivedData == "Representative James R. Baird"){
            Database.database().reference().child("Political Database").child("National").child("US Representative").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "US Representative Indiana"
                
            }
            
            Database.database().reference().child("Political Database").child("National").child("US Representative").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
        }else if(recivedData == "John R Dennis"){
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("1").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "Mayor of West Lafayette"
                
                Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("1").child("bio").observeSingleEvent(of: .value) { (snapshot) in
                    guard let name = snapshot.value as? String else {return}
                    self.bioText.text = name
                }

                
                Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("1").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                    guard let photoUrl = snapshot.value as? String else {return}
                    let url = URL(string: photoUrl)
                    self.headerImage.kf.setImage(with: url)
                }
                
                
            }
        }else if(recivedData == "Zachary Baiel"){
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("0").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "Candidate for Mayor of West Lafayette"
                
            }
            
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("0").child("bio").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.bioText.text = name
            }
            
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("0").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
        }else if (recivedData == "Eric Holcomb"){
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("0").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "Governor of Indiana"
                
            }
            
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("0").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("0").child("bio").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.bioText.text = name
            }
            
        }else if (recivedData == "Eddie Melton"){
            
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("1").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "Governor of Indiana Candidate"
                
            }
            
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("1").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("1").child("bio").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.bioText.text = name
            }
            
        }else if (recivedData == "Chris Campbell"){
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "Indiana State Representative"
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "profileToHome", sender: nil)
    }
    
    @IBAction func facebookTapped(_ sender: Any) {
        if (recivedData == "John R Dennis"){

        }
    }
    
    @IBAction func twitterTapped(_ sender: Any) {
        if(recivedData == "Zachary Baiel"){
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("0").child("channels").child("0").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
            
        }
    }
    
}
