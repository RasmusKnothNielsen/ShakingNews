//
//  ViewController.swift
//  ShakingNews
//
//  Created by Rasmus Knoth Nielsen on 24/04/2020.
//  Copyright © 2020 Rasmus Knoth Nielsen. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var webKitView: WKWebView!
    
    let arrayOfSites = ["DR": "https://www.dr.dk", "Reddit": "https://www.reddit.com", "JP": "https://www.jp.dk", "Heste Nettet": "https://www.heste-nettet.dk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveRandomURL()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Phone was shaken")
        retrieveRandomURL()
    }
    
    fileprivate func retrieveRandomURL() {
        let url = arrayOfSites.randomElement()!
        print("URL: \(url)")
        label.text = url.key
        webKitView.load(URLRequest(url: (URL(string: url.value) ?? URL(string: "https://www.google.com"))!))
    }
}

