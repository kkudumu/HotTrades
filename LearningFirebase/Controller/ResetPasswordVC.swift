//
//  ResetPasswordVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/16/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetPasswordTapped(_ sender: Any) {
//        DatabaseService.shared.resetPassword(email: emailTF.text!)
        Auth.auth().sendPasswordReset(withEmail: emailTF.text!) { (error) in
            if error != nil {
                let alert = UIAlertController(title: "Unidentified Email Address", message: "Please, re-enter the email you have registered with.", preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Password Reset Sent", message: "Please check your email for your password reset link.", preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                //        alert.popoverPresentationController?.sourceView = self.view
                self.present(alert, animated: true)
            }
        }


        
    }
    
    @IBAction func goBackTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}
