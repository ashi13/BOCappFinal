//
//  TripViewController.swift
//  BOCapp
//
//  Created by Andrew Murowchick on 4/26/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

protocol TripViewControllerDelegate {
    func addTripMember(member: UserProfile, toTrip: Trip)
    func getLeaders() -> [UserProfile]
    func getTrippers(trip: Trip) -> [UserProfile]
}

class TripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { //, TripViewDataSource {
 
    var delegate: TripViewControllerDelegate?
    
    // MARK: Properties for trip view
    @IBOutlet weak var tripPicture: UIImageView!
    @IBOutlet weak var tripName: PaddingLabel!
    @IBOutlet weak var tripLocation: PaddingLabel!
    @IBOutlet weak var tripDate: PaddingLabel!
    @IBOutlet weak var tripDescription: PaddingLabel!
    @IBOutlet weak var leaderName: PaddingLabel!
    @IBOutlet weak var leaderPicture: UIImageView!
    @IBOutlet weak var tripAvailibility: PaddingLabel!


    @IBOutlet weak var tripView: TripView!  // UIScrollView
    @IBOutlet weak var trippersTableView: UITableView!
    
    var trip: Trip? // Pushed over by segue when selected from TableView

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentTrip = self.trip
        return currentTrip!.tripMembers.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tripperCellIdentifier = "TrippersTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(tripperCellIdentifier, forIndexPath: indexPath) as! TrippersTableViewCell
        
        /*
        cell.tripperName.text = "Row #\(indexPath.row)"
        cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        
        let currentTrip = trip    // Grabs the right cell to load data to
        let tripMember = trip!.tripMembers[indexPath.row]
        
        // Load data to individual elements of TripTableViewCell
        cell.tripperName.text = currentTrip!.tripMembers[indexPath.row].firstName + " " + currentTrip!.tripMembers[indexPath.row].lastName
        
        cell.tripperName.text = tripMember.firstName
        cell.tripperName.text = "aksjdakj::"
        */
 
        return cell
    }
    

    
    @IBAction func joinPressed(sender: UIBarButtonItem) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let firstName = defaults.stringForKey("firstName")!
        let lastName = defaults.stringForKey("lastName")!
        let classYear = defaults.integerForKey("classYear")
        
        let currentUser = UserProfile(firstName: firstName, lastName: lastName, classYear: classYear, isLeader: true)
        
        let trippers = delegate?.getTrippers(trip!)
        
        for i in 0..<trippers!.count {
            if trippers![i].firstName == firstName && trippers![i].lastName == lastName {
                displayAlert("Already tripping")
                return
            }
        }
        
        displayAlert("Welcome aboard")
        delegate?.addTripMember(currentUser, toTrip: trip!)
        
        tripAvailibility.text = String(10-trip!.tripMembers.count) + "/10 spots available"
    }
    
    func displayAlert(text: String) {
        let alert = UIAlertController(title: "BOC", message: text, preferredStyle: UIAlertControllerStyle.Alert)
        
        let confirm = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(confirm)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
//    override func viewDidAppear(animated: Bool) {
//        loadView()
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let trip = trip {
            navigationItem.title = trip.title
            tripPicture.image = trip.image
            tripName.text = trip.title
            tripName.layer.cornerRadius = 5.0
            tripName.clipsToBounds = true
            
            tripDescription.text = trip.description
            tripDescription.lineBreakMode = .ByWordWrapping
            tripDescription.numberOfLines = 0
            tripDescription.layer.cornerRadius = 5.0
            tripDescription.clipsToBounds = true
            
            tripLocation.text = trip.location
            tripLocation.layer.cornerRadius = 5.0
            tripLocation.clipsToBounds = true
            
            leaderName.text = trip.leader.firstName + " " + trip.leader.lastName
            leaderName.layer.cornerRadius = 5.0
            leaderName.clipsToBounds = true
            
            leaderPicture.image = trip.leader.image
            leaderPicture.layer.cornerRadius = 6.0
            leaderPicture.clipsToBounds = true
            
            tripAvailibility.text = String(10-trip.tripMembers.count) + "/10 spots available"
            
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.ShortStyle
            
            tripDate.text = formatter.stringFromDate(trip.date)
            
            
            tripName.sizeToFit()
            tripDescription.sizeToFit()
            tripLocation.sizeToFit()
            leaderName.sizeToFit()
            
            //self.trippersTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TrippersViewTableCell")
            //trippersTableView.delegate = self
            //trippersTableView.dataSource = self
            
            
        }

        
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
