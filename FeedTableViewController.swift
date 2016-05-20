//
//  FeedTableViewController.swift
//  BOCapp
//
//  Created by Andrew Murowchick on 4/26/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController, CreateTripDelegate, TripViewControllerDelegate {  // Adopts necessary protocols for delegate and datasource
    
    // MARK: Properties
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var trips = [Trip]()
    var users = [UserProfile]()
    
    /* Method loads predefined trips to show in trip feed */
    func loadSampleTrips() {
        trips = [Trips().kayakTrip!, Trips().mountainTrip!, Trips().whiteWater!, Trips().hiking1!, Trips().hiking2!, Trips().surfing!, Trips().surfing2!]
    }
    /* Method loads predefined UserProfiles to trip feed */
    func loadSampleUsers() {
        users = [UserProfiles().AndrewMurowchick!, UserProfiles().AlexShi!]
    }

    func addTrip(trip: Trip){
        trips.insert(trip, atIndex: 0)
    }
    
    func getLeaders() -> [UserProfile] {
        return users
    }
    
    func addTripMember(member: UserProfile, toTrip: Trip) {
        print("called")
        for i in 0...trips.count - 1 {
            if trips[i].title == toTrip.title {
                print("found trip")
                print(trips[i].tripMembers.count)
                trips[i].tripMembers.append(member)
                print(trips[i].tripMembers.count)
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //tripTableView.dataSource = self
        //tripTableView.delegate = self
        
        // Load sample data
        loadSampleTrips()
        loadSampleUsers()
        
        // For SWReveal sidebar
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let userLoggedin = NSUserDefaults.standardUserDefaults().boolForKey("userLoggedin")
        if !userLoggedin {
            self.performSegueWithIdentifier("Show Login", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tripCellIdentifier = "TripTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(tripCellIdentifier, forIndexPath: indexPath) as! TripTableViewCell
        
        let trip = trips[indexPath.row]     // Grabs the right cell to load data to
        
        // Load data to individual elements of TripTableViewCell
        cell.tripName.text = trip.title
        
        cell.tripPicture.image = trip.image
        cell.tripPicture.layer.cornerRadius = 8.0
        cell.tripPicture.clipsToBounds = true
        
        cell.tripLocation.text = trip.location
        
        cell.leaderPicture.image = trip.leader.image
        cell.leaderPicture.layer.cornerRadius = 5.0
        cell.leaderPicture.clipsToBounds = true
        
        cell.leaderName.text = trip.leader.firstName + " " + trip.leader.lastName
        cell.tripCapacity.text = String(trip.tripMembers.count) + "/10"
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        cell.tripDate.text = formatter.stringFromDate(trip.date)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    /* User logout button */
    @IBAction func logoutPressed(sender: UIBarButtonItem) {
        logoutUser()
    }
    
    func logoutUser() {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "userLoggedin")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.performSegueWithIdentifier("Show Login", sender: self)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDetail" {
//            let nav = segue.destinationViewController as! UINavigationController
//            let tripDetailViewController = nav.topViewController as! TripViewController
            
            let tripDetailViewController = segue.destinationViewController as! TripViewController
            tripDetailViewController.delegate = self
            
            // Provide access to trip selected in main view
            if let selectedTripCell = sender as? TripTableViewCell {  // Selected TripTableViewCell
                let indexPath = tableView.indexPathForCell(selectedTripCell)!
                let selectedTrip = trips[indexPath.row]
                tripDetailViewController.trip = selectedTrip
            }
        }
        
    }
    

}
