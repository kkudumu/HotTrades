//
//  MessagingService.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/14/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import Foundation
import FirebaseMessaging

enum SubscriptionTopic: String {
    case newPosts = "newPosts"
    case freePosts = "freePosts"
}
class MessagingService {
    
    private init() {}
    static let shared = MessagingService()
    let messaging = Messaging.messaging()
    
    func subscribe(to topic: SubscriptionTopic) {
        messaging.subscribe(toTopic: topic.rawValue)
    }
    
    func unsubscribe(from topic: SubscriptionTopic) {
        messaging.unsubscribe(fromTopic: topic.rawValue)
    }
    
}
