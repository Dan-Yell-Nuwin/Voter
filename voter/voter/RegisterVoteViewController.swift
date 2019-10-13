//
//  RegisterVoteViewController.swift
//  voter
//
//  Created by Kunwar Sahni on 10/13/19.
//  Copyright © 2019 mhacks. All rights reserved.
//

import UIKit
import WebKit

class RegisterVoteViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.vote.org")
        webView.load(URLRequest(url: url!))
    }
}
