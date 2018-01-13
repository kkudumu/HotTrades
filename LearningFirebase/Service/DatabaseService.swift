//
//  DatabaseService.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import Foundation
import Firebase

class DatabaseService {
    
    static let shared = DatabaseService()
    private init() {}
    //creating a path to the database for the "posts" reference
    let postsReference = Database.database().reference().child("posts")
    
    
}
