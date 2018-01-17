//
//  SignUpVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/12/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onBackTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "BackToSignUpSegue", sender: self)
    }
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        
        guard let firstName = firstNameTF.text,
        firstName != "",
        let lastName = lastNameTF.text,
        lastName != "",
        let email = emailTF.text,
        email != "",
        let password = passwordTF.text,
        password != ""
        else {
            AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all fields.")
            return
        }
        
        
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let uid = user?.uid else { return }
            let role = "role"
            let userReference = DatabaseService.shared.REF_BASE.child("users").child(uid)
            let parameters = ["first name": firstName, "last name": lastName, "email": email, role: "user"]
            
            userReference.updateChildValues(parameters, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print(error!)
                    return
                }
                self.dismiss(animated: true, completion: nil)
            })
            
            
            guard let user = user else { return }
            print(user.email ?? "MISSING EMAIL")
            print(user.uid)
            //make change request on user profile
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = firstName + " " + lastName
            changeRequest.commitChanges(completion: { (error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
                
                self.performSegue(withIdentifier: "SignUpToSignInSegue", sender: nil)
                
            })
            
            
        })
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
