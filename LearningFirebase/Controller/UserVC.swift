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
    var onCellTap: ((_ data: String) -> ())?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //        label.text = "Hello \(firstLast)" - added in case we want to welcome users in the future. May need to change it to just first name in the displayName though.
        
        //observe data that is passed at reference point/ posts reference
        DatabaseService.shared.REF_BASE.child("users").observe(.value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                guard let uid = Auth.auth().currentUser?.uid else { return }
                DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").observeSingleEvent(of: .value, with: { (snapshot) in
                    print(snapshot)
                    guard let postsSnapshot = PostsSnapshot(with: snapshot) else { return }
                    print("POSTSNAP:\(postsSnapshot)")
                    self.posts = postsSnapshot.posts
                    print("POSTSNAP.POSTS:\(postsSnapshot)")
                    //sorting posts in the proper order
                    self.posts.sort(by: { $0.date.compare($1.date) == .orderedDescending })
                    self.tableView.reloadData()
                })

            }
        }
    }

    
    @IBAction func onUserLogOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "UserSignOutSegue", sender: nil)
        } catch {
            print(error)
        }
    }

    @IBAction func onSubscribeTapped() {
        AlertController.subscribeAlert(in: self)
    }
}



//creating table view
extension UserVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if posts[indexPath.row].pair == "AUD/CAD" {
            performSegue(withIdentifier: "TOAUDCAD", sender: self)
        } else if posts[indexPath.row].pair == "AUD/CHF" {
            performSegue(withIdentifier: "TOAUDCHF", sender: self)
        } else if posts[indexPath.row].pair == "AUD/JPY" {
            performSegue(withIdentifier: "TOAUDJPY", sender: self)
        } else if posts[indexPath.row].pair == "AUD/NZD" {
            performSegue(withIdentifier: "TOAUDNZD", sender: self)
        } else if posts[indexPath.row].pair == "AUD/USD" {
            performSegue(withIdentifier: "TOAUDUSD", sender: self)
        } else if posts[indexPath.row].pair == "CAD/CHF" {
            performSegue(withIdentifier: "TOCADCHF", sender: self)
        } else if posts[indexPath.row].pair == "CAD/JPY" {
            performSegue(withIdentifier: "TOCADJPY", sender: self)
        } else if posts[indexPath.row].pair == "CHF/JPY" {
            performSegue(withIdentifier: "TOCHFJPY", sender: self)
        } else if posts[indexPath.row].pair == "EUR/AUD" {
            performSegue(withIdentifier: "TOEURAUD", sender: self)
        } else if posts[indexPath.row].pair == "EUR/CAD" {
            performSegue(withIdentifier: "TOEURCAD", sender: self)
        } else if posts[indexPath.row].pair == "EUR/CHF" {
            performSegue(withIdentifier: "TOEURCHF", sender: self)
        } else if posts[indexPath.row].pair == "EUR/GBP" {
            performSegue(withIdentifier: "TOEURGBP", sender: self)
        } else if posts[indexPath.row].pair == "EUR/JPY" {
            performSegue(withIdentifier: "TOEURJPY", sender: self)
        } else if posts[indexPath.row].pair == "EUR/NZD" {
            performSegue(withIdentifier: "TOEURNZD", sender: self)
        } else if posts[indexPath.row].pair == "EUR/USD" {
            performSegue(withIdentifier: "TOEURUSD", sender: self)
        } else if posts[indexPath.row].pair == "GBP/AUD" {
            performSegue(withIdentifier: "TOGBPAUD", sender: self)
        } else if posts[indexPath.row].pair == "GBP/CAD" {
            performSegue(withIdentifier: "TOGBPCAD", sender: self)
        } else if posts[indexPath.row].pair == "GBP/CHF" {
            performSegue(withIdentifier: "TOGBPCHF", sender: self)
        } else if posts[indexPath.row].pair == "GBP/JPY" {
            performSegue(withIdentifier: "TOGBPJPY", sender: self)
        } else if posts[indexPath.row].pair == "GBP/NZD" {
            performSegue(withIdentifier: "TOGBPNZD", sender: self)
        } else if posts[indexPath.row].pair == "GBP/USD" {
            performSegue(withIdentifier: "TOGBPUSD", sender: self)
        } else if posts[indexPath.row].pair == "NZD/CAD" {
            performSegue(withIdentifier: "TONZDCAD", sender: self)
        } else if posts[indexPath.row].pair == "NZD/CHF" {
            performSegue(withIdentifier: "TONZDCHF", sender: self)
        } else if posts[indexPath.row].pair == "NZD/JPY" {
            performSegue(withIdentifier: "TONZDJPY", sender: self)
        } else if posts[indexPath.row].pair == "NZD/USD" {
            performSegue(withIdentifier: "TONZDUSD", sender: self)
        } else if posts[indexPath.row].pair == "USD/CAD" {
            performSegue(withIdentifier: "TOUSDCAD", sender: self)
        } else if posts[indexPath.row].pair == "USD/CHF" {
            performSegue(withIdentifier: "TOUSDCHF", sender: self)
        } else if posts[indexPath.row].pair == "USD/JPY" {
            performSegue(withIdentifier: "TOUSDJPY", sender: self)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        cell.signalLabel?.text = posts[indexPath.row].signal
        cell.symbolLabel?.text = posts[indexPath.row].pair
        cell.priceLabel?.text = posts[indexPath.row].price
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let post = self.posts[indexPath.row]
            DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").child(post.postId).removeValue(completionBlock: { (error, ref) in
                if error != nil {
                    print("ERROR: ", error!)
                    return
                }
//                DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").child(post.postId).observe(.childRemoved, with: { (snapshot) in
//                    self.posts.remove(at: indexPath.row)
//
//                })
                DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").observe(.childRemoved, with: { (snapshot) in
                    if let index = self.posts.index(where: {$0.postId == snapshot.key}) {
                        self.posts.remove(at: index)
                        self.tableView.reloadData()
                    } else {
                        print("item not found")
                    }
                })
            })
           
            
        }
    }
    
}



