//
//  RegisterUserViewController.swift
//  BOCapp
//
//  Created by Alexander Shi on 5/18/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordRepeatTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var classYearTextField: UITextField!
    
    @IBOutlet weak var allergiesTextView: UITextView!
    
    @IBOutlet weak var registerView: UIScrollView!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RegisterUserViewController.dismissKeyboard)))
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func registerPressed(sender: UIButton) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        let repeatPassword = passwordRepeatTextField.text
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let classYear = classYearTextField.text
        let allergies = allergiesTextView.text
        
        // Check empty fields
        if username!.isEmpty || password!.isEmpty {
            displayAlert("Please fill in username and password")
        }
        
        // Check to see if password fields match
        else if password != repeatPassword {
            displayAlert("Passwords do not match")
        }
        else if firstName!.isEmpty || lastName!.isEmpty {
            displayAlert("Please fill in your name")
        }
        else if classYear!.isEmpty {
            displayAlert("Please fill in your class year")
        }
        
        // Store data
        NSUserDefaults.standardUserDefaults().setObject(username, forKey: "username")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "password")
        NSUserDefaults.standardUserDefaults().setObject(firstName, forKey: "firstName")
        NSUserDefaults.standardUserDefaults().setObject(lastName, forKey: "lastName")
        NSUserDefaults.standardUserDefaults().setObject(classYear, forKey: "classYear")
        NSUserDefaults.standardUserDefaults().setObject(allergies, forKey: "allergies")
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
        // Confirmation alert message
        confirmationAlert()
        
        
    }
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        print("as")
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        profileImage.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    func displayAlert(text: String) {
        let alert = UIAlertController(title: "Alert", message: text, preferredStyle: UIAlertControllerStyle.Alert)
        
        let confirm = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(confirm)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func confirmationAlert() {
        let alert = UIAlertController(title: "Alert", message: "Registration Successful", preferredStyle: UIAlertControllerStyle.Alert)
        
        let confirm = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: { action in self.dismissViewControllerAnimated(true, completion: nil) } )
        
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
