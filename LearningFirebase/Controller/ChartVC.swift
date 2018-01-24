//
//  ChartVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/17/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import WebKit
import Firebase

class ChartVC: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var webView: WKWebView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.currencyCheck()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
