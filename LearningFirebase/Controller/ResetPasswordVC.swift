//
//  ResetPasswordVC.swift
//  LearningFirebase
//
//  Created by Kioja Kudumu on 1/16/18.
//  Copyright © 2018 Kioja Kudumu. All rights reserved.
//

import UIKit

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
        DatabaseService.shared.resetPassword(email: emailTF.text!)
    }
    
    @IBAction func goBackTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "GoBackToLoginSegue", sender: nil)
    }
    
}
