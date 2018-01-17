//
//  SignInVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //unwrap the user path to reach the "roles" and assign appropriate view controller base on role
    func assignUserRole(theUid: String) {
        let userRef = DatabaseService.shared.REF_BASE.child("users").child(theUid)
        userRef.observeSingleEvent(of: .value) { (snapshot) in
            let userDict = snapshot.value as! [String: Any]
            let userRole = userDict["role"] as! String
            if userRole == "admin"{
                self.performSegue(withIdentifier: "SignInToSignalsSegue", sender: self)
            } else {
                self.performSegue(withIdentifier: "ToUserVC", sender: self)
            }
        }
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
       self.performSegue(withIdentifier: "ResetPWSegue", sender: nil)
        
        
    }
    
    
    
    //sign in and validation logic. Check for errors if there
    @IBAction func onSignInTapped(_ sender: Any) {
        
        guard let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
            else {
                AlertController.showAlert(self, title: "Missing info", message: "Please fill out all required fields")
                return
                
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return }
            let uid = user.uid
            self.assignUserRole(theUid: uid)
            print(user.email ?? "MISSING EMAIL")
            print(user.displayName ?? "MISSING DISPLAY NAME")
            print(user.uid)
            
        }
        self.emailTF.resignFirstResponder()
        self.passwordTF.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "SignInToSignUpSegue", sender: nil)
        
    }
    
    
    
}
    


