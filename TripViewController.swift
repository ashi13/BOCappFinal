//
//  TripViewController.swift
//  BOCapp
//
//  Created by Andrew Murowchick on 4/26/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class TripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { //, TripViewDataSource {
 
    
    // MARK: Properties for trip view
    @IBOutlet weak var tripPicture: UIImageView!
    @IBOutlet weak var tripName: PaddingLabel!
    @IBOutlet weak var tripLocation: PaddingLabel!
    @IBOutlet weak var tripDate: PaddingLabel!
    @IBOutlet weak var tripDescription: PaddingLabel!
    @IBOutlet weak var leaderName: PaddingLabel!
    @IBOutlet weak var leaderPicture: UIImageView!
    @IBOutlet weak var tripAvailibility: PaddingLabel!
    
//    @IBOutlet weak var tripView: TripView! {
//        didSet {
//            tripView.dataSource = self
//        }
//    }
//    
//    func getTripInfo() -> Trip? {
//        return nil
//    }
//    
//    var model = Trips()

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
    
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("kjshfkjhsd")
        
        let tripperCellIdentifier = "TrippersTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(tripperCellIdentifier, forIndexPath: indexPath) as! TrippersTableViewCell
        
        
        cell.tripperName.text = "Row #\(indexPath.row)"
        //cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        
        //let currentTrip = trip    // Grabs the right cell to load data to
        //let tripMember = trip!.tripMembers[indexPath.row]
        
        // Load data to individual elements of TripTableViewCell
//        cell.tripperName.text = currentTrip!.tripMembers[indexPath.row].firstName + " " + currentTrip!.tripMembers[indexPath.row].lastName
        
        //cell.tripperName.text = tripMember.firstName
        //cell.tripperName.text = "aksjdakj::"
        
        return cell
    }
    

    
    @IBAction func joinPressed(sender: UIBarButtonItem) {
        let defaults = NSUserDefaults.standardUserDefaults()
        var currentUser = UserProfile(firstName: defaults.stringForKey("firstName")!, lastName: defaults.stringForKey("lastName")!, classYear: Int(defaults.stringForKey("classYear")!)!, isLeader: true)
        
        
        trip?.tripMembers.append(currentUser)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let trip = trip {
            navigationItem.title = trip.title
            tripPicture.image = trip.image
            tripName.text = trip.title
            
            tripDescription.text = trip.description
            tripDescription.lineBreakMode = .ByWordWrapping
            tripDescription.numberOfLines = 0
            
            tripLocation.text = trip.location
            
            leaderName.text = trip.leader.firstName + " " + trip.leader.lastName
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
