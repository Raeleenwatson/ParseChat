//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Raeleen Watson on 9/29/18.
//  Copyright © 2018 Raeleen Watson. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource {
    
    var messages : [PFObject] = []

    @IBOutlet weak var chatMessageField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButton(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage["user"] = PFUser.current()
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.chatMessageField.text = ""
                
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
    
        
        return cell
    }
    
//    func fetchMessages(){
//        let query = Message.query()
//        query?.includeKey("user")
//        query?.addDescendingOrder("createdAt")
//        query?.limit = 20
//
//        query?.findObjectsInBackground{ (messages: [PFObject]?,error: Error?) -> Void in
//            if let messages = messages{
//                self.messages = messages
//                self.tableView.reloadData()
//                print(messages)
//            }
//            else{
//            }
//        }
//    }
//
    @objc func onTimer() {
        //fetchMessages()
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
