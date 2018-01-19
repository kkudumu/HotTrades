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
    
//    func currencyCheck() {
//
//        let ref = DatabaseService.shared.REF_BASE.child("posts")
//        ref.observeSingleEvent(of: .value) { (snapshot) in
//            for snap in snapshot.children {
//            let postSnap = snap as! DataSnapshot
//            let postDict = postSnap.value as! [String: Any]
//            let postPair = postDict["pair"] as! String
//                    if postPair == "AUD/CAD" {
//                        self.AUDCAD()
//                    } else if postPair == "AUD/CHF" {
//                        self.AUDCHF()
//                    } else if postPair == "AUD/JPY" {
//                        self.AUDJPY()
//                    } else if postPair == "AUD/NZD" {
//                        self.AUDNZD()
//                    } else if postPair == "AUD/USD" {
//                        self.AUDUSD()
//                    } else if postPair == "CAD/CHF" {
//                        self.CADCHF()
//                    } else if postPair == "CAD/JPY" {
//                        self.CADJPY()
//                    } else if postPair == "CHF/JPY" {
//                        self.CHFJPY()
//                    } else if postPair == "EUR/AUD" {
//                        self.EURAUD()
//                    } else if postPair == "EUR/CAD" {
//                        self.EURCAD()
//                    } else if postPair == "EUR/CHF" {
//                        self.EURCHF()
//                    } else if postPair == "EUR/GBP" {
//                        self.EURGBP()
//                    } else if postPair == "EUR/JPY" {
//                        self.EURJPY()
//                    } else if postPair == "EUR/NZD" {
//                        self.EURNZD()
//                    } else if postPair == "EUR/USD" {
//                        self.EURUSD()
//                    } else if postPair == "GBP/AUD" {
//                        self.GBPAUD()
//                    } else if postPair == "GBP/CAD" {
//                        self.GBPCAD()
//                    } else if postPair == "GBP/CHF" {
//                        self.GBPCHF()
//                    } else if postPair == "GBP/JPY" {
//                        self.GBPJPY()
//                    } else if postPair == "GBP/NZD" {
//                        self.GBPNZD()
//                    } else if postPair == "GBP/USD" {
//                        self.GBPUSD()
//                    } else if postPair == "NZD/CAD" {
//                        self.NZDCAD()
//                    } else if postPair == "NZD/CHF" {
//                        self.NZDCHF()
//                    } else if postPair == "NZD/JPY" {
//                        self.NZDJPY()
//                    } else if postPair == "NZD/USD" {
//                        self.NZDUSD()
//                    } else if postPair == "USD/CAD" {
//                        self.USDCAD()
//                    } else if postPair == "USD/CHF" {
//                        self.USDCHF()
//                    } else if postPair == "USD/JPY" {
//                        self.USDJPY()
//                    }
//                            }
//        }
//    }
    
    
    
 
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
