//
//  ProfileViewController.swift
//  BOCapp
//
//  Created by Alexander Shi on 5/18/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var classYear: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // For SWReveal sidebar
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        firstName.text = NSUserDefaults.standardUserDefaults().stringForKey("firstName")
        lastName.text = NSUserDefaults.standardUserDefaults().stringForKey("lastName")
        classYear.text = String(NSUserDefaults.standardUserDefaults().integerForKey("classYear"))

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* Image picker methods */

    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        //nameTextField.resignFirstResponder()
        
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
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//        if let trip = trip {
//            navigationItem.title = trip.title
//            tripPicture.image = trip.image
//            tripName.text = trip.title
//            tripDescription.text = trip.description
//            tripLocation.text = trip.location
//            leaderName.text = trip.leaderName
//            leaderPicture.image = trip.leaderImage
//            tripAvailibility.text = String(10-trip.tripMembers.count) + "/10 spots available"
//            
//            
//            tripName.sizeToFit()
//            tripDescription.sizeToFit()
//            tripLocation.sizeToFit()
//            leaderName.sizeToFit()
//            
//            
//            
//        }
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
