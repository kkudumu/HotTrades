//
//  ViewController.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class ViewController: UIViewController {
    
    var posts = [Post]()
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
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
    @IBAction func onAddTapped(_ sender: Any) {
        
    }
    
    
 //receive data from the pickervc w/ popup.onsave/freeusersave
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPickerVC" {
            let popup = segue.destination as! PickerVC
            popup.onSave = onSave
            popup.freeUserSave = freeUserSave
        } else if segue.identifier == "ToChartImageFromAdmin" {
        let destViewController: ChartImageController = segue.destination as! ChartImageController
        destViewController.newImage = photoThumbnail
        }
    }
    
    
    @IBAction func notificationTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "Paid Notifications On", style: .default) { (_) in
            MessagingService.shared.subscribe(to: .newPosts)
           
        }
        let unsubscribe = UIAlertAction(title: "Paid Notifications Off", style: .destructive) { (_) in
            MessagingService.shared.unsubscribe(from: .newPosts)
        }
        let freeSubscribe = UIAlertAction(title: "Free Notifications On", style: .default) { (_) in
            MessagingService.shared.subscribe(to: .freePosts)
            
        }

        let freeUnsubscribe = UIAlertAction(title: "Free Notifications Off", style: .destructive) { (_) in
            MessagingService.shared.unsubscribe(from: .freePosts)
        }
        
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
        alert.addAction(freeSubscribe)
        alert.addAction(freeUnsubscribe)
        alert.popoverPresentationController?.sourceView = self.view
        
        present(alert, animated: true)
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

        DatabaseService.shared.REF_BASE.child("users").observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                DatabaseService.shared.REF_BASE.child("users").child(snap.key).child("role").observeSingleEvent(of: .value) { (snapshot) in
                    if snapshot.value as! String == "subscribed_user" {
                DatabaseService.shared.REF_BASE.child("users").child(snap.key).child("posts").childByAutoId().setValue(parameters)
                    } else if snapshot.value as! String == "admin" {
                        DatabaseService.shared.REF_BASE.child("users").child(snap.key).child("posts").childByAutoId().setValue(parameters)
                    }
            }
        }
    }
        DatabaseService.shared.REF_BASE.child("posts_for_notifications").childByAutoId().setValue(parameters)
        
    }
    var photoThumbnail: UIImage!
    
    func freeUserSave(_ orderData: String,_ pairData: String, _ priceData: String, imageURL: String) -> () {
        
        let dateString = String(describing: Date())
        
        let parameters = ["signal"       :orderData,
                          "pair"         :pairData,
                          "price"        :priceData,
                          "date"         :dateString,
                          "imageURL"     :imageURL,
                          "isPending"    :"false"]
        
        //generates new ID for each post and set values in our database as parameters

        DatabaseService.shared.REF_BASE.child("users").observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                DatabaseService.shared.REF_BASE.child("users").child(snap.key).child("role").observeSingleEvent(of: .value) { (snapshot) in
                    print(snapshot.value as! String, "snapshot.value as string")
                    if snapshot.value as! String == "free_user" {
                        DatabaseService.shared.REF_BASE.child("users").child(snap.key).child("posts").childByAutoId().setValue(parameters)
                    }
                }
            }
        }
        DatabaseService.shared.REF_BASE.child("posts_for_free_users_notifications").childByAutoId().setValue(parameters)
    }
    
    //limit landscape to ipads
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIInterfaceOrientationMask(rawValue: UIInterfaceOrientationMask.RawValue(UIInterfaceOrientation.portrait.rawValue))
        }
        else {
            return UIInterfaceOrientationMask.all
        }
    }
    
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return UIInterfaceOrientation.unknown
    }
    
    override public var shouldAutorotate: Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        }
        else {
            return false
        }
    }
    
}




extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AdminTableViewCell
        photoThumbnail = cell.postImageView.image
        performSegue(withIdentifier: "ToChartImageFromAdmin", sender: self)
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
        
        
        
        if let postImageURL = post.imageURL {
            let url = URL(string: postImageURL)
            cell.postImageView.kf.setImage(with: url)

        }
        

        
        cell.signalLabel?.text = posts[indexPath.row].signal
        cell.symbolLabel?.text = posts[indexPath.row].pair
        cell.priceLabel?.text = posts[indexPath.row].price
        
       
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let closeAction = UIContextualAction(style: .normal, title: "Close") { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in

            let cell = tableView.cellForRow(at: indexPath) as! AdminTableViewCell
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
                        self.tableView.reloadData()
                    }
                })
            })
        }
        return [delete, pending]
    }
    


}




