//
//  UNService.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/14/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import UserNotifications

class UNService: NSObject {
    
    private override init() {}
    static let shared = UNService()
    let unCenter = UNUserNotificationCenter.current()
    
    //get authorization to send notifications
    func authorize() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        unCenter.requestAuthorization(options: options) { (granted, error) in
            print(error ?? "No UN authorization error")
            guard granted else { return }
            DispatchQueue.main.async {
                self.configure()
            }
        }
    }
    func configure() {
        unCenter.delegate = self
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
    }
    
}

extension UNService: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("UN Did Receive")
        
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("UN Will Present")
        
        let options: UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(options)
        
        
    }
    
}
