//
//  getDirections.swift
//  voter
//
//  Created by Kunwar Sahni on 10/13/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import Foundation
import UIKit


class getDirections: UIViewController {
    
    
    
    @IBAction func getDirections(_ sender: Any) {
        
        let strLat : String = "40.424702"
        let strLong : String = "-86.910278"
        
        if let url = URL(string: "comgooglemaps://?saddr=&daddr=\(strLat),\(strLong)&directionsmode=driving") {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
}



