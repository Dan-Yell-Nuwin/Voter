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
    @IBOutlet weak var partyImage: UIImageView!
    @IBOutlet weak var newsImage1: UIImageView!
    @IBOutlet weak var newsLabel1: UILabel!
    @IBOutlet weak var newsImage2: UIImageView!
    @IBOutlet weak var newsLabel2: UILabel!
    
    
    var recivedData: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        newsImage1.layer.cornerRadius = newsImage1.frame.width/14.0
        newsImage1.clipsToBounds = true
        newsImage2.layer.cornerRadius = newsImage2.frame.width/14.0
        newsImage2.clipsToBounds = true

        if(recivedData == "President Donald Trump"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("0").child("name:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "President of the United States"
            }
            
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("0").child("photo:").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
           Database.database().reference().child("Political Database").child("National").child("President of the United States").child("0").child("bio:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.bioText.text = name
            }
            
            
        }else if(recivedData == "Joseph Biden"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("1").child("name:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "President of the United States Candidate"
            }
            
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("1").child("photo:").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("1").child("bio:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.bioText.text = name
            }
            
            
        } else if(recivedData == "Mike Braun"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("1").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "US Senator"
            }
            
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("1").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("1").child("bio").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.bioText.text = name
            }
            
            
        } else if(recivedData == "Senator Todd Young"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("0").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "US Senator Candidate"

            }
            
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("0").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("0").child("bio").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.bioText.text = name
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
        }else if (recivedData == "Ronald Bacon"){
            Database.database().reference().child("Political Database").child("State").child("IN State Representative").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "Indiana State Representative"
                
            }
            
            Database.database().reference().child("Political Database").child("State").child("IN State Representative").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
            Database.database().reference().child("Political Database").child("State").child("IN State Representative").child("bio").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.bioText.text = name
            }
        }else if (recivedData == "Larry"){
            Database.database().reference().child("Political Database").child("National").child("US Representative").child("0").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.nameLabel.text = name
                self.positionLabel.text = "Indiana State Representative"
                
            }
            
            Database.database().reference().child("Political Database").child("National").child("US Representative").child("0").child("photo").observeSingleEvent(of: .value) { (snapshot) in
                guard let photoUrl = snapshot.value as? String else {return}
                let url = URL(string: photoUrl)
                self.headerImage.kf.setImage(with: url)
            }
            
            Database.database().reference().child("Political Database").child("National").child("US Representative").child("0").child("bio").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                self.bioText.text = name
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
        if (recivedData == "Eric Holcomb"){
             Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("0").child("channels").child("0").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://facebook.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        } else if(recivedData == "Eddie Melton"){
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("1").child("channels").child("1").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://facebook.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        } else if (recivedData == "Ronald Bacon"){
            Database.database().reference().child("Political Database").child("State").child("IN State Representative").child("channels").child("1").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://facebook.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        } else if (recivedData == "President Donald Trump"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("0").child("channel").child("0").child("id:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://facebook.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }
        else if (recivedData == "Joseph Biden"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("1").child("channel").child("0").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://facebook.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }
        else if (recivedData == "Mike Braun"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("1").child("channels").child("0").child("id:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://facebook.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }
        else if (recivedData == "Senator Todd Young"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("0").child("channels").child("0").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://facebook.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }
        
        else if (recivedData == "Larry"){
            Database.database().reference().child("Political Database").child("National").child("US Representative").child("0").child("channels").child("0").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://facebook.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }

    }
        
    
    @IBAction func twitterTapped(_ sender: Any) {
        if(recivedData == "Zachary Baiel"){
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("0").child("channels").child("0").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
            
        } else if (recivedData == "Eric Holcomb"){
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("0").child("channels").child("1").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        } else if(recivedData == "Eddie Melton"){
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("1").child("channels").child("0").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        } else if (recivedData == "Ronald Bacon"){
            Database.database().reference().child("Political Database").child("State").child("IN State Representative").child("channels").child("0").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        } else if (recivedData == "President Donald Trump"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("0").child("channel").child("1").child("id:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }
        else if (recivedData == "Joseph Biden"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("1").child("channel").child("1").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }
        
        else if (recivedData == "Mike Braun"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("1").child("channels").child("1").child("id:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }
        else if (recivedData == "Senator Todd Young"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("0").child("channels").child("1").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }
        
        else if (recivedData == "Larry"){
            Database.database().reference().child("Political Database").child("National").child("US Representative").child("0").child("channels").child("1").child("id").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                guard let url = URL(string: "https://twitter.com/\(name)") else { return }
                UIApplication.shared.open(url)
            }
        }

    }
    
    @IBAction func tappedParty(_ sender: Any) {
        if(recivedData == "John R Dennis"){
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("1").child("party").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                if(name == "Independent"){
                    self.partyImage.image = UIImage(named: "independent")
                }else if(name == "Republican"){
                    self.partyImage.image = UIImage(named: "republican")
                }else if(name == "Democratic"){
                    self.partyImage.image = UIImage(named: "democrat")
                }
            }

        }else if(recivedData == "Zachary Baiel"){
            Database.database().reference().child("Political Database").child("Local").child("Mayor of West Lafayette").child("0").child("party").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                if(name == "Independent"){
                    self.partyImage.image = UIImage(named: "independent")
                }else if(name == "Republican"){
                    self.partyImage.image = UIImage(named: "republican")
                }else if(name == "Democratic" || name == "Democrat Party"){
                    self.partyImage.image = UIImage(named: "democrat")
                }
            }
        }else if(recivedData == "Eric Holcomb"){
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("0").child("party").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                if(name == "Independent"){
                    self.partyImage.image = UIImage(named: "independent")
                }else if(name == "Republican" || name == "Republican Party"){
                    self.partyImage.image = UIImage(named: "republican")
                }else if(name == "Democratic" || name == "Democrat Party"){
                    self.partyImage.image = UIImage(named: "democrat")
                }
            }
        }else if(recivedData == "Eddie Melton"){
            Database.database().reference().child("Political Database").child("State").child("Governor of Indiana").child("1").child("party").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                if(name == "Independent"){
                    self.partyImage.image = UIImage(named: "independent")
                }else if(name == "Republican" || name == "Republican Party"){
                    self.partyImage.image = UIImage(named: "republican")
                }else if(name == "Democratic" || name == "Democrat Party"){
                    self.partyImage.image = UIImage(named: "democrat")
                }
            }
 
        }else if(recivedData == "Ronald Bacon"){
            Database.database().reference().child("Political Database").child("State").child("IN State Representative").child("name").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                if(name == "Independent"){
                    self.partyImage.image = UIImage(named: "independent")
                }else if(name == "Republican" || name == "Republican Party"){
                    self.partyImage.image = UIImage(named: "republican")
                }else if(name == "Democratic" || name == "Democrat Party"){
                    self.partyImage.image = UIImage(named: "democrat")
                }
            }
        }else if(recivedData == "President Donald Trump"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("0").child("party:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                if(name == "Independent"){
                    self.partyImage.image = UIImage(named: "independent")
                }else if(name == "Republican" || name == "Republican Party"){
                    self.partyImage.image = UIImage(named: "republican")
                }else if(name == "Democratic" || name == "Democrat Party"){
                    self.partyImage.image = UIImage(named: "democrat")
                }
            }
        }else if(recivedData == "Joseph Biden"){
            Database.database().reference().child("Political Database").child("National").child("President of the United States").child("1").child("party:").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                if(name == "Independent"){
                    self.partyImage.image = UIImage(named: "independent")
                }else if(name == "Republican" || name == "Republican Party"){
                    self.partyImage.image = UIImage(named: "republican")
                }else if(name == "Democratic" || name == "Democrat Party" || name == "Democratic Party"){
                    self.partyImage.image = UIImage(named: "democrat")
                }
            }
        }else if(recivedData == "Mike Braun"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("1").child("party").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                if(name == "Independent"){
                    self.partyImage.image = UIImage(named: "independent")
                }else if(name == "Republican" || name == "Republican Party"){
                    self.partyImage.image = UIImage(named: "republican")
                }else if(name == "Democratic" || name == "Democrat Party" || name == "Democratic Party"){
                    self.partyImage.image = UIImage(named: "democrat")
                }
            }
        }else if(recivedData == "Senator Todd Young"){
            Database.database().reference().child("Political Database").child("National").child("US Senator").child("0").child("party").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
            if(name == "Independent"){
                self.partyImage.image = UIImage(named: "independent")
            }else if(name == "Republican" || name == "Republican Party"){
                self.partyImage.image = UIImage(named: "republican")
            }else if(name == "Democratic" || name == "Democrat Party" || name == "Democratic Party"){
                self.partyImage.image = UIImage(named: "democrat")
            }
        }

        }else if(recivedData == "Larry"){
            Database.database().reference().child("Political Database").child("National").child("US Representative").child("0").child("party").observeSingleEvent(of: .value) { (snapshot) in
                guard let name = snapshot.value as? String else {return}
                if(name == "Independent"){
                    self.partyImage.image = UIImage(named: "independent")
                }else if(name == "Republican" || name == "Republican Party"){
                    self.partyImage.image = UIImage(named: "republican")
                }else if(name == "Democratic" || name == "Democrat Party" || name == "Democratic Party"){
                    self.partyImage.image = UIImage(named: "democrat")
                }
            }
        }
    }
    
    
}


