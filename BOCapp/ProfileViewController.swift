//
//  ProfileViewController.swift
//  BOCapp
//
//  Created by Alexander Shi on 5/18/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // For SWReveal sidebar
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        name.text = NSUserDefaults.standardUserDefaults().stringForKey("firstName")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
