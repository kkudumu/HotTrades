//
//  SubPayVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/26/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import StoreKit
import SwiftyStoreKit



class SubPayVC: UIViewController {
    
    @IBOutlet weak var subscriptionButton: UIButton!
    
    
    let inAppPurchaseId = [
        ["com.kkudumu.LearningFirebase.ChippSubscription"]
    ]

    

    let sharedSecret = "0f9d089ef8b64c368c3d9b503334ad21"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inAppPurchaseButtons = [
            [subscriptionButton]
        ]
        
        for i in 0...inAppPurchaseId.count - 1 {
            for j in 0...inAppPurchaseId[i].count - 1 {
                SwiftyStoreKit.retrieveProductsInfo([inAppPurchaseId[i][j]]) { result in
                    if let product = result.retrievedProducts.first {
                        let priceString = product.localizedPrice!
                        print("Product: \(product.localizedDescription), price: \(priceString)")
                        inAppPurchaseButtons[i][j]?.setTitle("Subscribe", for: .normal)
                        self.verifySubscription(with: self.inAppPurchaseId[i][j], sharedSecret: self.sharedSecret, type: .autoRenewable)
                    
                    }
                    else if let invalidProductId = result.invalidProductIDs.first {
                        print("Invalid product identifier: \(invalidProductId)")
                    }
                    else {
                        print("Error: \(String(describing: result.error))")
                    }
                }
            }
        }
        

        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func purchaseProduct(with id: String) {
        SwiftyStoreKit.retrieveProductsInfo([id]) { result in
            if let product = result.retrievedProducts.first {
                SwiftyStoreKit.purchaseProduct(product, quantity: 1, atomically: true) { result in
                    switch result {
                    case .success(let product):
                        // fetch content from your server, then:
                        if product.needsFinishTransaction {
                            SwiftyStoreKit.finishTransaction(product.transaction)
                        }
                        print("Purchase Success: \(product.productId)")
                    case .error(let error):
                        switch error.code {
                        case .unknown: print("Unknown error. Please contact support")
                        case .clientInvalid: print("Not allowed to make the payment")
                        case .paymentCancelled: break
                        case .paymentInvalid: print("The purchase identifier was invalid")
                        case .paymentNotAllowed: print("The device is not allowed to make the payment")
                        case .storeProductNotAvailable: print("The product is not available in the current storefront")
                        case .cloudServicePermissionDenied: print("Access to cloud service information is not allowed")
                        case .cloudServiceNetworkConnectionFailed: print("Could not connect to the network")
                        case .cloudServiceRevoked: print("User has revoked permission to use this cloud service")
                        }
                    }
                }
            }
        }
    }
    
    
    func purchaseSubscription(with id: String, sharedSecret: String, type: SubscriptionType, validDuration: TimeInterval? = nil) {
        
        SwiftyStoreKit.purchaseProduct(id, atomically: true) { result in
            
            if case .success(let purchase) = result {
                // Deliver content from server, then:
                if purchase.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(purchase.transaction)
                }
                
                guard let validDuration = validDuration else {return}
                self.verifySubscription(with: id, sharedSecret: sharedSecret, type: type, validDuration: validDuration)
                

            } else {
                // purchase error
            }
        }
    }
    
    func verifyPurchase(with id: String, sharedSecret: String) {
        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: sharedSecret)
        SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
            switch result {
            case .success(let receipt):
                // Verify the purchase of Consumable or NonConsumable
                let purchaseResult = SwiftyStoreKit.verifyPurchase(
                    productId: id,
                    inReceipt: receipt)
                
                switch purchaseResult {
                case .purchased(let receiptItem):
                    print("\(id) is purchased: \(receiptItem)")
                case .notPurchased:
                    print("The user has never purchased \(id)")
                }
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
    }
    
    enum SubscriptionType: Int {
        case autoRenewable = 0,
        nonRenewing
    }
    
    func restorePurchases() {
        SwiftyStoreKit.restorePurchases(atomically: true) { results in
            if results.restoreFailedPurchases.count > 0 {
                print("Restore Failed: \(results.restoreFailedPurchases)")
            }
            else if results.restoredPurchases.count > 0 {
                print("Restore Success: \(results.restoredPurchases)")
            }
            else {
                print("Nothing to Restore")
            }
        }
    }
    
    func verifySubscription(with id: String, sharedSecret: String, type: SubscriptionType, validDuration: TimeInterval? = nil) {
        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: sharedSecret)
        SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
            switch result {
            case .success(let receipt):
                let productId = id
                // Verify the purchase of a Subscription
                
                switch type {
                case .autoRenewable:
                    let purchaseResult = SwiftyStoreKit.verifySubscription(
                        ofType: .autoRenewable, // or .nonRenewing (see below)
                        productId: productId,
                        inReceipt: receipt)
                    
                    switch purchaseResult {
                    case .purchased(let expiryDate, let items):
                        print("\(productId) is valid until \(expiryDate)\n\(items)\n")
                    case .expired(let expiryDate, let items):
                        print("\(productId) is expired since \(expiryDate)\n\(items)\n")
                    case .notPurchased:
                        print("The user has never purchased \(productId)")
                    }
                case .nonRenewing:
                    guard let validDuration = validDuration else {return}
                    let purchaseResult = SwiftyStoreKit.verifySubscription(
                        ofType: .nonRenewing(validDuration: validDuration),
                        productId: id,
                        inReceipt: receipt)

                    
                    switch purchaseResult {
                    case .purchased(let expiryDate, let items):
                        print("\(productId) is valid until \(expiryDate)\n\(items)\n")
                    case .expired(let expiryDate, let items):
                        print("\(productId) is expired since \(expiryDate)\n\(items)\n")
                    case .notPurchased:
                        print("The user has never purchased \(productId)")
                    }
                }
                
                
                
            case .error(let error):
                print("Receipt verification failed: \(error)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func subscribeButtonPressed(_ sender: UIButton) {
        purchaseSubscription(with: inAppPurchaseId[0][0], sharedSecret: sharedSecret, type: .autoRenewable)

    }
    @IBAction func restoreButtonPressed(_ sender: UIButton) {
        restorePurchases()
    }
    
    

}
