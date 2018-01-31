//
//  SubChoiceVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/26/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase
import SwiftyStoreKit
import StoreKit

class SubChoiceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        IAPService.shared.getProducts()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func freeUserButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ToFreeUserVC", sender: self)
    }

    @IBAction func logOutButtonPressed(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "SignOutToSignInVC", sender: nil)
        } catch {
            print(error)
        }
        
    }
    
    
    
    @IBAction func subscribedUserButtonPressed(_ sender: UIButton) {
        //TODO Check if user has subscribed via swiftystorekit, then if subscribed, change user role to "subscribed_user", take user to vc with "ToUserVC" segue
        let uid = Auth.auth().currentUser?.uid
        DatabaseService.shared.REF_BASE.child("users").child(uid!).child("role").observeSingleEvent(of: .value) { (snapshot) in
            
            //do our payment check to see if user has receipt, if they do, role == "subscribed_user", if role == "subscribed_user", go to uservc, else, user is not subscribed and alert should show up saying they need to subscribe or use the free version
            let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: "0f9d089ef8b64c368c3d9b503334ad21")
            SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
                switch result {
                case .success(let receipt):
                    let productId = "com.kkudumu.LearningFirebase.ChippSubscription"
                    // Verify the purchase of a Subscription
                    let purchaseResult = SwiftyStoreKit.verifySubscription(
                        ofType: .autoRenewable, // or .nonRenewing (see below)
                        productId: productId,
                        inReceipt: receipt)
                    
                    switch purchaseResult {
                        
                        //users that have an active subscription
                    case .purchased(let expiryDate, let items):
                        print("*********** SHOULD GO TO USER VC ***********")
                        if snapshot.value as! String == "free_user" {
                            DatabaseService.shared.REF_BASE.child("users").child(uid!).updateChildValues(["role":"subscribed_user"])
                            self.performSegue(withIdentifier: "ToUserVC", sender: self)
                            
                        }
                        print("\(productId) is valid until \(expiryDate)\n\(items)\n")
                        print("*********** USER SHOULD HAVE GONE TO USER VC *************")
                        
                        //users that have an expired subscription
                    case .expired(let expiryDate, let items):
                        if snapshot.value as! String == "subscribed_user" {
                            DatabaseService.shared.REF_BASE.child("users").child(uid!).updateChildValues(["role":"free_user"])
                            print("demoted to free user until resubscribe")
                        }
                        print("*********** EXPIRED ALERT SHOULD HAPPEN ********************")
                        let alert = UIAlertController(title: "Subscription Expired", message: "Please renew your subscription to continue with paid signals.", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                        
                        
                        print("\(productId) is expired since \(expiryDate)\n\(items)\n")
                        print("*********** EXPIRED ALERT SHOULD HAVE HAPPENED BEFORE THIS PRINT ********************")
                        
                        //users that have not purchased a subscription
                    case .notPurchased:
                        print("*********** NOT PURCHASED ALERT SHOULD HAPPEN ****************")
                        print("The user has never purchased \(productId)")
                        let alert = UIAlertController(title: "Not Currently Subscribed", message: "Please subscribe to view paid signals", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                        print("*********** NOT PURCHASED ALERT SHOULD HAVE HAPPENED ******************")
                    }
                    
                case .error(let error):
                    print("Receipt verification failed: \(error)")
                }
            }
            
            
        }
        
        
    }
    
    @IBAction func toSubscribeButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "ToSubPayVC", sender: self)
    }
    
}
