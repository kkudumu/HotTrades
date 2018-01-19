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

    @IBAction func onSubscribeTapped() {
        AlertController.subscribeAlert(in: self)
    }
    
}


//creating table view
extension UserVC: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if posts[indexPath.row].pair == "AUD/CAD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
            
        } else if posts[indexPath.row].pair == "AUD/CHF" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "AUD/JPY" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "AUD/NZD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "AUD/USD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "CAD/CHF" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "CAD/JPY" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "CHF/JPY" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "EUR/AUD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "EUR/CAD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "EUR/CHF" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "EUR/GBP" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "EUR/JPY" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "EUR/NZD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "EUR/USD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "GBP/AUD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "GBP/CAD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "GBP/CHF" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "GBP/JPY" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "GBP/NZD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "GBP/USD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "NZD/CAD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "NZD/CHF" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "NZD/JPY" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "NZD/USD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "USD/CAD" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "USD/CHF" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
        } else if posts[indexPath.row].pair == "USD/JPY" {
            performSegue(withIdentifier: "ToChartSegue", sender: self)
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
    
}



