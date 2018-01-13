//
//  Post.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import Foundation

struct Post {
    
    let postId: String
    let message: String
    let username: String
    let date: Date
    
    init?(postId: String, dict: [String: Any]) {
        self.postId = postId
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
        
        guard let username = dict["username"] as? String,
        let message = dict["message"] as? String,
        let dateString = dict["date"] as? String,
        let date = dateFormatter.date(from: dateString)
            else { return nil}
        
        self.username = username
        self.message = message
        self.date = date
    }
    
}
