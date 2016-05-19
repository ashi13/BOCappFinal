//
//  Trips.swift
//  BOCapp
//
//  Created by Alexander Shi on 4/19/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

//hard-coded set of trips

import Foundation
import UIKit

class Trips {
    
    
    let kayakTrip = Trip(title: "Kayaking", imageName: "kayaking", leader: UserProfile(firstName: "Andrew", lastName: "Murowchick", imageName: "murow_profile", classYear: 2016, isLeader: true)!, description: "We will kayak and it will be so much fun trust us!!!", location: "Somewhere with water", date: NSDate(), tripMembers: [UserProfiles().AlexShi!, UserProfiles().AndrewMurowchick!])
    
    let mountainTrip = Trip(title: "Moutaineering", imageName: "mountainpic", leader: UserProfile(firstName: "Samuel", lastName: "Jackson", imageName: "samueljackson", classYear: 2017, isLeader: true)!, description: "We will mountain and it will be so much fun trust us!!!", location: "Somewhere hilly", date: NSDate(), tripMembers: [UserProfiles().AlexShi!])
    
    let whiteWater = Trip(title: "White Water Kayaking", imageName: "whitewaterpic", leader: UserProfile(firstName: "Will", lastName: "Smith", imageName: "willsmith", classYear: 2019, isLeader: true)!, description: "We will white water kayak and it will be so much fun trust us!!!", location: "Somewhere wet", date: NSDate(), tripMembers: [])
    
    let hiking1 = Trip(title: "Hiking 1", imageName: "hiking1pic", leader: UserProfile(firstName: "Tom", lastName: "Hanks", imageName: "tomhanks", classYear: 2016, isLeader: true)!, description: "We will hike and it will be so much fun trust us!!!", location: "Somewhere foresty", date: NSDate(), tripMembers: [])
    
    let hiking2 = Trip(title: "Hiking 2", imageName: "hiking2pic", leader: UserProfile(firstName: "Will", lastName: "Smith", imageName: "willsmith", classYear: 2019, isLeader: true)!, description: "We will hike way better than hiking 1 and it will be so much fun trust us!!!", location: "Somewhere more foresty", date: NSDate(), tripMembers: [])
    
    let surfing = Trip(title: "Surfing", imageName: "surfing1pic", leader: UserProfile(firstName: "Andrew", lastName: "Murowchick", imageName: "murow_profile", classYear: 2016, isLeader: true)!, description: "We will surf and it will be so much fun trust us!!!", location: "Somewhere with gnar waves", date: NSDate(), tripMembers: [])
    
    let surfing2 = Trip(title: "Surfing 2", imageName: "surfing2pic", leader: UserProfile(firstName: "Tom", lastName: "Hanks", imageName: "tomhanks", classYear: 2016, isLeader: true)!, description: "We will surf better than surfing 1 and it will be so much fun trust us!!!", location: "Somewhere with more gnar waves", date: NSDate(), tripMembers: [])
    
}