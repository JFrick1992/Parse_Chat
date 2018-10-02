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
        
    }
    @IBAction func signupButton(_ sender: UIButton) {
        signupUser()
    }
    func signupUser() {
        let newUser = PFUser()
        newUser.username = usernameField.text
        //newUser.email
    }
    func loginUser() {
        
    }
}
