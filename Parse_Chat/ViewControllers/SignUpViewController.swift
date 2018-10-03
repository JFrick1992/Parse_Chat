//
//  SignUpViewController.swift
//  Parse_Chat
//
//  Created by Jacob Frick on 10/2/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signUpButtonClick(_ sender: Any) {

        if((usernameField.text?.isEmpty)! || (emailField.text?.isEmpty)! || (passwordField.text?.isEmpty)!) {
            present(self.buildEmptyFieldAlertController(), animated: true){}
        }
        else {
            signupUser()
        }
    }
    func signupUser() {
        let user = PFUser()
        user.username = usernameField.text
        user.email = emailField.text
        user.password = passwordField.text
        user.signUpInBackground
            { (success, error) in
                if let errorN = error {
                    print(errorN.localizedDescription)
                } else if success {
                    self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                }
            }
            
        }
        
    }
   
    

