//
//  SideBarTableViewController.swift
//  BOCapp
//
//  Created by Alexander Shi on 5/19/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class SideBarTableViewController: UITableViewController {
    
    var selectedMenuItem: Int = 0
    var menuItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var menuItems = ["Navigation", "Trip Feed", "Profile", "Request Trip", "Create Trip"]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("cell")
//        
//        cell!.textLabel?.text = "ViewController #\(indexPath.row+1)"
        
        //let MenuCellIdentifier = menuItems[1]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath)
        
        
        // Configure the cell...
        
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (indexPath.row == selectedMenuItem) {
            return
        }
        selectedMenuItem = indexPath.row
        
        print(selectedMenuItem)
        
//        let mainStoryBoard: UIStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        var destvc: UIViewController
//        
//        switch (indexPath.row) {
//        case 0:
//            destvc = mainStoryBoard.instantiateViewControllerWithIdentifier("View Controller 1")
//        default:
//            break
//            
//            
//        }
        
    
        
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

    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //let indexPath = [self.tableView.indexPathForSelected]
        

        
        if segue.identifier == "Show User Profile" {
            var destination: UIViewController? = segue.destinationViewController
            if let navCon = destination as? UINavigationController {
                destination = navCon.visibleViewController
            }
        }

    }
 */

}