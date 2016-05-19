//
//  CreateTripViewController.swift
//  BOCapp
//
//  Created by Alexander Shi on 5/18/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

protocol CreateTripDataSource : class {
    func addTrip(trip: Trip)
    func getLeaders() -> [UserProfile]
}

class CreateTripViewController: UIViewController {
    
    weak var dataSource: CreateTripDataSource?
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tripName: UITextView!
    @IBOutlet weak var location: UITextView!
    @IBOutlet weak var tripDescription: UITextView!
    @IBOutlet weak var tripDate: UIDatePicker!
    @IBOutlet weak var capacityPicker: UIPickerView!
    @IBOutlet weak var leaderPicker: UIPickerView!
    @IBOutlet weak var tripImage: UIImageView!
    
    @IBOutlet weak var createTripView: UIScrollView!
    
    @IBAction func createTripPressed(sender: UIBarButtonItem) {
        
        let leaderName = leaderPicker.description
        var allUsers = dataSource?.getLeaders()
        var leader = UserProfile()
  
        for i in 0...allUsers!.count {
            if leaderName == String(allUsers![i].firstName + " " + allUsers![i].lastName) {
                leader = allUsers![i]
            }
        }
        
        let currentTrip = Trip(title: tripName.description, image: tripImage.image!, leader: leader, description: tripDescription.description, location: location.description, date: tripDate.date, tripMembers: [leader])
        
        dataSource?.addTrip(currentTrip)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        createTripView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RegisterUserViewController.dismissKeyboard)))
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
