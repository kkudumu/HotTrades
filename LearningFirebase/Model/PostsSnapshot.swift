//
//  PostsSnapshot.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import Foundation
import Firebase

struct PostsSnapshot {
    
    let posts: [Post]
    //taking the value of a snapshot, string for the key and has a dictionary, then created a post from snapshot value in dictionary
    init?(with snapshot: DataSnapshot) {
        
        var posts = [Post]()
        guard let snapDict = snapshot.value as? [String: [String: Any]] else { return nil }
        for snap in snapDict {
            guard let post = Post(postId: snap.key, dict: snap.value) else { continue }
            posts.append(post)
        }
        self.posts = posts
    }
}
