//
//  AlertController.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//


import UIKit

class AlertController {

    static func showAlert(_ inViewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
    }
    static func subscribeAlert(in vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "Subscribe", style: .default) { (_) in
            MessagingService.shared.subscribe(to: .newPosts)
        }
        let unsubscribe = UIAlertAction(title: "Unsubscribe", style: .default) { (_) in
            MessagingService.shared.unsubscribe(from: .newPosts)
        }
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
        vc.present(alert, animated: true)
    }
    
}
