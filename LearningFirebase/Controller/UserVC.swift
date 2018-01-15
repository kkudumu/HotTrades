//
//  ViewController.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase

class UserVC: UIViewController {
    
    var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        //        label.text = "Hello \(firstLast)" - added in case we want to welcome users in the future. May need to change it to just first name in the displayName though.
        
        //observe data that is passed at reference point/ posts reference
        DatabaseService.shared.postsReference.observe(DataEventType.value, with: { (snapshot) in
            print(snapshot)
            //if this guard works, we have our posts
            guard let postsSnapshot = PostsSnapshot(with: snapshot) else { return }
            self.posts = postsSnapshot.posts
            //sorting posts in the proper order
            self.posts.sort(by: { $0.date.compare($1.date) == .orderedDescending })
            self.tableView.reloadData()
        })
        
    }
    @IBAction func onUserLogOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "UserSignOutSegue", sender: nil)
        } catch {
            print(error)
        }
    }

    
}
//creating table view
extension UserVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = posts[indexPath.row].message
        cell.detailTextLabel?.text = posts[indexPath.row].username
        return cell
    }
    
}



