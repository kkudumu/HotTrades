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
        
//        guard let firstLast = Auth.auth().currentUser?.displayName else { return }
        
//        label.text = "Hello \(firstLast)" - added in case we want to welcome users in the future. May need to change it to just first name in the displayName though.
        
        //observe data that is passed at reference point/ posts reference
        DatabaseService.shared.REF_BASE.child("users").observe(.value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                DatabaseService.shared.REF_BASE.child("users").child(snap.key).child("posts").observeSingleEvent(of: .value, with: { (snapshot) in
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
    func onSave(_ orderData: String,_ pairData: String, _ priceData: String) -> () {
        
        let dateString = String(describing: Date())
        
        let parameters = ["signal"       :orderData,
                          "pair"         :pairData,
                          "price"        :priceData,
                          "date"         :dateString]
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminTableViewCell", for: indexPath) as! AdminTableViewCell
        
        cell.signalLabel?.text = posts[indexPath.row].signal
        cell.symbolLabel?.text = posts[indexPath.row].pair
        cell.priceLabel?.text = posts[indexPath.row].price
        
        return cell
    }
    

}



