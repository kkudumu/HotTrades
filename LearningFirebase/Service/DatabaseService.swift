//
//  DatabaseService.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()




class DatabaseService {
    
    
    static let shared = DatabaseService()
    private init() {}
    //creating a path to the database for the "posts" reference
    let postsReference = Database.database().reference().child("posts")
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_ADMINS = DB_BASE.child("admins")
    private var _REF_POSTS = DB_BASE.child("posts")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    var REF_USERS: DatabaseReference {
        return _REF_BASE
    }
    var REF_ADMINS: DatabaseReference {
        return _REF_ADMINS
    }
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, Any>, isAdmin: Bool) {
        if isAdmin {
            REF_ADMINS.child(uid).updateChildValues(userData)
        } else {
            REF_USERS.child(uid).updateChildValues(userData)
        }
        
    }
    func reference(_ databaseReference: DatabaseReference) -> DatabaseReference {
        return Database.database().reference().child("posts")
    }
    
    func observe(_ databaseReference: DatabaseReference, completion: @escaping (DataSnapshot) -> Void) {
        reference(databaseReference).observe(.value) { (snapshot) in
            completion(snapshot)
        }
    }
        
    func post(parameters: [String: Any], to databaseReference: DatabaseReference) {
        reference(databaseReference).childByAutoId().setValue(parameters)
    }
    
    
}

