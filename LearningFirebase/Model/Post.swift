//
//  Post.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import Foundation
import UIKit

struct Post {
    
    let postId: String
    let signal: String
    let pair: String
    let price: String
    let date: Date
    let imageURL: String?
    
    
    init?(postId: String, dict: [String: Any]) {
        self.postId = postId
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
        
        guard let signal = dict["signal"] as? String,
        let price = dict["price"] as? String,
        let pair = dict["pair"] as? String,
        let dateString = dict["date"] as? String,
        let imageURL = dict["imageURL"] as? String,
        let date = dateFormatter.date(from: dateString)
            else { return nil}
        
        self.signal = signal
        self.price = price
        self.pair = pair
        self.date = date
        self.imageURL = imageURL
        
    }
    
}
