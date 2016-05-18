//
//  UserLoginViewController.swift
//  BOCapp
//
//  Created by Alexander Shi on 5/18/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginPressed(sender: UIButton) {
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        let storedUsername = NSUserDefaults.standardUserDefaults().stringForKey("username")
        let storedPassword = NSUserDefaults.standardUserDefaults().stringForKey("password")
        
        if username == storedUsername {
            
            if password == storedPassword {
                
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "userLoggedin")
                NSUserDefaults.standardUserDefaults().synchronize()
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }
            
        } else {
            
        }
        
    }
    

    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
