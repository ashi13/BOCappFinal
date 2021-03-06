//
//  Trip.swift
//  BOCapp
//
//  Created by Andrew Murowchick on 4/26/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import Foundation
import UIKit

class Trip {
    
    // MARK: Properties
    
    var title: String
    var imageName: String
    var image: UIImage?
    var location: String
    var date: NSDate
    
    /*
    var leaderName: String
    var leaderImageName: String
    var leaderImage: UIImage?
    var leaderDescription: String
    */
    
    var leader: UserProfile
    var description: String
    var tripMembers: [UserProfile]
    
    
    // MARK: Initialization
    
    /* Initialize with UIImage */
    init(title: String, image: UIImage, leader: UserProfile, description: String, location: String, date: NSDate, tripMembers: [UserProfile]) {
        
        self.title = title
        self.imageName = "image"
        self.image = image
        self.location = location
        
        self.date = date
        
        self.leader = leader
        
        self.description = description
        self.tripMembers = tripMembers
    }
    
    /* Initialize with string name for UIImage */
    init?(title: String, imageName: String, leader: UserProfile, description: String, location: String, date: NSDate, tripMembers: [UserProfile]){
        
        self.title = title
        self.imageName = imageName
        self.image = UIImage(named: imageName)
        self.location = location
        
        self.date = date
        
        self.leader = leader
        
        self.description = description
        self.tripMembers = tripMembers
        
        
        
    }
    
    
}