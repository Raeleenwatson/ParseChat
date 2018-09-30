//
//  ViewController.swift
//  ParseChat
//
//  Created by Raeleen Watson on 9/28/18.
//  Copyright © 2018 Raeleen Watson. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        let username = usernameField.text
        let password = passwordField.text
        
        if ((passwordField.text?.isEmpty)! || (usernameField.text?.isEmpty)!) {
            let alertController = UIAlertController(title: "Unable to Log in", message: "Please enter your username and password", preferredStyle: .alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
        }
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
            }
        }
    
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        if ((passwordField.text?.isEmpty)! || (usernameField.text?.isEmpty)!) {
            let alertController = UIAlertController(title: "Unable to Sign Up", message: "Please enter a username and password", preferredStyle: .alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        }
   
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("User Registered successfully")
                
                //self.performSegue(withIdentifier: "loginSegue", sender: nil)
                // manually segue to logged in view
            }
        }

        
        
    }
    
    
    

}

