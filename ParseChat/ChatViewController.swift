//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Raeleen Watson on 9/29/18.
//  Copyright © 2018 Raeleen Watson. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var chatMessageField: UITextField!
    @IBAction func sendButton(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.chatMessageField.text = nil
                
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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