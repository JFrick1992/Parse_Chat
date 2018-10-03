//
//  ChatViewController.swift
//  Parse_Chat
//
//  Created by Jacob Frick on 10/3/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class ChatViewController: UIViewController {

    @IBOutlet weak var newMessageField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        if !((newMessageField.text?.isEmpty)!) {
            chatMessage["text"] = newMessageField.text
            chatMessage.saveInBackground() {
                (success, error) in
                    if success {
                        print("Message saved")
                        self.newMessageField.text = ""
                
                    } else
                        if let error = error {
                            print(error.localizedDescription)
                        }
            }
        }
    }
}
    


