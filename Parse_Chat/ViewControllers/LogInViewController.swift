//
//  LogInViewController.swift
//  Parse_Chat
//
//  Created by Jacob Frick on 10/2/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class LogInViewController: UIViewController {


    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        if((usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)!) {
            present(self.buildEmptyFieldAlertController(), animated: true){}
        }
        else {
            loginUser()
        }
    }

    func loginUser() {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) {
            (user , error) in
            if user != nil {
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
