//
//  ChatViewController.swift
//  Parse_Chat
//
//  Created by Jacob Frick on 10/3/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class ChatViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newMessageField: UITextField!
    var messages = [PFObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        onTimer()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        if !((newMessageField.text?.isEmpty)!) {
            chatMessage["text"] = newMessageField.text
            let username = (PFUser.current()?.username)
            chatMessage["username"] = username
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        let mes = messages[indexPath.row]
        cell.chatLabel.text = mes["text"] as? String
        cell.usernameLabel.text = mes["username"] as? String
        return cell
    }
    @objc func onTimer() {
        let query : PFQuery = PFQuery(className: "Message")
        query.addDescendingOrder("createdAt")
        query.limit = 100
        
        query.findObjectsInBackground(block: { (posts, error) in
            if let posts = posts {
                self.messages = posts
                self.tableView.reloadData()
                if(self.messages.count == 0) {
                    self.tableView.isHidden = true
                } else {
                    self.tableView.isHidden = false
                }
            }
        })
    }
    @IBAction func logout(_ sender: Any) {
        PFUser.logOut()
        
    }
    
    
}
    


