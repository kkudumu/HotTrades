//
//  AlertController.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//


import UIKit

class AlertController {
    
    var button: UIButton?

    static func showAlert(_ inViewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
    }
    //subscribed user notifications
    static func subscribeAlert(in vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "On", style: .default) { (_) in
            MessagingService.shared.subscribe(to: .newPosts)
            MessagingService.shared.unsubscribe(from: .freePosts)
        }
        let unsubscribe = UIAlertAction(title: "Off", style: .default) { (_) in
            MessagingService.shared.unsubscribe(from: .newPosts)
            MessagingService.shared.unsubscribe(from: .freePosts)
        }
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
   
        vc.present(alert, animated: true)
    }
    //free user notifications
    static func subscribeFreeAlert(in vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "On", style: .default) { (_) in
            MessagingService.shared.subscribe(to: .freePosts)
            MessagingService.shared.unsubscribe(from: .newPosts)
        }
        let unsubscribe = UIAlertAction(title: "Off", style: .default) { (_) in
            MessagingService.shared.unsubscribe(from: .freePosts)
            MessagingService.shared.unsubscribe(from: .newPosts)
        }
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
//        alert.popoverPresentationController?.sourceView = self.view
        vc.present(alert, animated: true)
    }
    
   
}

extension UIAlertController {
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .all
        }
    }

