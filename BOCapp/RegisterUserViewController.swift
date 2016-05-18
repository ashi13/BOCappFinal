//
//  RegisterUserViewController.swift
//  BOCapp
//
//  Created by Alexander Shi on 5/18/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func registerPressed(sender: UIButton) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        // Check empty fields
        if (username!.isEmpty || password!.isEmpty) {
            
            // Alert message
            displayAlert("All fields required")
            
            return;
            
            
        }
        
        
        // Store data
        
        // Confirmation alert message
        
    }
    
    
    func displayAlert(text: String) {
        let alert = UIAlertController(title: "Alert", message: text, preferredStyle: UIAlertControllerStyle.Alert)
        
        let confirm = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(confirm)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
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
