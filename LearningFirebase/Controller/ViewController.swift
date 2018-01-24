//
//  ViewController.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var posts = [Post]()
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        guard let firstLast = Auth.auth().currentUser?.displayName else { return }
        
//        label.text = "Hello \(firstLast)" - added in case we want to welcome users in the future. May need to change it to just first name in the displayName though.
        
        //observe data that is passed at reference point/ posts reference
        DatabaseService.shared.REF_BASE.child("users").observe(.value) { (snapshot) in

                guard let uid = Auth.auth().currentUser?.uid else { return }
                DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").observeSingleEvent(of: .value, with: { (snapshot) in
                    guard let postsSnapshot = PostsSnapshot(with: snapshot) else { return }
                    self.posts = postsSnapshot.posts
                    //sorting posts in the proper order
                    self.posts.sort(by: { $0.date.compare($1.date) == .orderedDescending })
                    self.tableView.reloadData()
                })
        }
        
        
        
        
    }
    @IBAction func onLogOutTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "SignOutSegue", sender: nil)
        } catch {
            print(error)
        }
        
    }

    
    //Creating text fields to pop up for Chipp to add signals.
    @IBAction func onAddTapped(_ sender: Any) {
      
        
        let alert = UIAlertController(title: "Add A Signal", message: "What Signal Would You Like To Add?", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter signal here"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let post = UIAlertAction(title: "Signal", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            print(text)
          
            }
        alert.addAction(cancel)
        alert.addAction(post)
//        present(alert, animated: true, completion: nil)
        performSegue(withIdentifier: "ToPickerVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPickerVC" {
            let popup = segue.destination as! PickerVC
            popup.onSave = onSave
        }
    }
    
    
    //grab data from our picker and save to firebase
    func onSave(_ orderData: String,_ pairData: String, _ priceData: String, imageURL: String) -> () {
        
        let dateString = String(describing: Date())
        
        let parameters = ["signal"       :orderData,
                          "pair"         :pairData,
                          "price"        :priceData,
                          "date"         :dateString,
                          "imageURL"     :imageURL,
                          "isPending"    :"false"]
        
        //generates new ID for each post and set values in our database as parameters
//        DatabaseService.shared.postsReference.childByAutoId().setValue(parameters)
        DatabaseService.shared.REF_BASE.child("users").observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                DatabaseService.shared.REF_BASE.child("users").child(snap.key).child("posts").childByAutoId().setValue(parameters)
            }
        }
        
    }
}



//creating table view
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminTableViewCell", for: indexPath) as! AdminTableViewCell
        let uid = Auth.auth().currentUser?.uid
        let post = self.posts[indexPath.row]

        DatabaseService.shared.REF_BASE.child("users").child(uid!).child("posts").child(post.postId).child("isPending").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.value as! String == "false" {
                cell.backgroundColor = UIColor.white
            } else if snapshot.value as! String == "true" {
                cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            }
            
        })
        
//        cell.imageView?.image = UIImage(named: "icons8-notification-500")
        if let postImageURL = post.imageURL {
            cell.postImageView.loadImageUsingCacheWithUrlString(urlString: postImageURL)
            
//            let url = URL(string: postImageURL)
//            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//                if error != nil {
//                    print(error)
//                    return
//                }
//                DispatchQueue.main.async {
//                   cell.postImageView.image = UIImage(data: data!)
//                }
//
//            }).resume()
        }
        
        cell.signalLabel?.text = posts[indexPath.row].signal
        cell.symbolLabel?.text = posts[indexPath.row].pair
        cell.priceLabel?.text = posts[indexPath.row].price
        
       
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let closeAction = UIContextualAction(style: .normal, title: "Close") { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdminTableViewCell", for: indexPath) as! AdminTableViewCell
            UIPasteboard.general.string = cell.priceLabel.text
            
            success(true)
        }
        closeAction.title = "Copy"
        closeAction.backgroundColor = .purple
        
        return UISwipeActionsConfiguration(actions: [closeAction])
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let pending = UITableViewRowAction(style: .normal, title: "Pending") { (action, indexPath) in
            
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let post = self.posts[indexPath.row]
            DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").child(post.postId).child("isPending").observeSingleEvent(of: .value, with: { (snapshot) in
                if snapshot.value as! String == "false" {
                    DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").child(post.postId).updateChildValues(["isPending":"true"])
                } else if snapshot.value as! String == "true" {
                    print(snapshot.value as! String)
                    DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").child(post.postId).updateChildValues(["isPending":"false"])
                }
               
            })
            tableView.reloadData()
            
            
        }
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let post = self.posts[indexPath.row]
            DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").child(post.postId).removeValue(completionBlock: { (error, ref) in
                if error != nil {
                    print("ERROR: ", error!)
                    return
                }
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
        return [delete, pending]
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.delete {
//            guard let uid = Auth.auth().currentUser?.uid else { return }
//            let post = self.posts[indexPath.row]
//            DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").child(post.postId).removeValue(completionBlock: { (error, ref) in
//                if error != nil {
//                    print("ERROR: ", error!)
//                    return
//                }
//
//                DatabaseService.shared.REF_BASE.child("users").child(uid).child("posts").observe(.childRemoved, with: { (snapshot) in
//                    if let index = self.posts.index(where: {$0.postId == snapshot.key}) {
//                        self.posts.remove(at: index)
//                        self.tableView.reloadData()
//                    } else {
//                        print("item not found")
//                    }
//                })
//            })
//
//
//        }
//    }

}




