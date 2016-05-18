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
    
    let kayakTrip = Trip(title: "Kayaking", imageName: "kayaking", leaderName: "Andrew Murowchick", leaderImageName: "murow_profile", leaderDescription: "Really cool guy!", description: "We will kayak and it will be so much fun trust us!!!", location: "Somewhere with water", tripMembers: [UserProfiles().AlexShi!, UserProfiles().AndrewMurowchick!])
    
    let mountainTrip = Trip(title: "Moutaineering", imageName: "mountainpic", leaderName: "Will Smith", leaderImageName: "willsmith", leaderDescription: "Really cool guy!", description: "We will mountain and it will be so much fun trust us!!!", location: "Somewhere hilly", tripMembers: [UserProfiles().AlexShi!])
    
    let whiteWater = Trip(title: "White Water Kayaking", imageName: "whitewaterpic", leaderName: "Tom Hanks", leaderImageName: "tomhanks", leaderDescription: "Really cool guy!", description: "We will white water kayak and it will be so much fun trust us!!!", location: "Somewhere wet", tripMembers: [])
    
    let hiking1 = Trip(title: "Hiking 1", imageName: "hiking1pic", leaderName: "Samuel Jackson", leaderImageName: "samueljackson", leaderDescription: "Really cool guy!", description: "We will hike and it will be so much fun trust us!!!", location: "Somewhere foresty", tripMembers: [])
    
    let hiking2 = Trip(title: "Hiking 2", imageName: "hiking2pic", leaderName: "Will Smith", leaderImageName: "willsmith", leaderDescription: "Really cool guy!", description: "We will hike way better than hiking 1 and it will be so much fun trust us!!!", location: "Somewhere more foresty", tripMembers: [])
    
    let surfing = Trip(title: "Surfing", imageName: "surfing1pic", leaderName: "Andrew Murowchick", leaderImageName: "murow_profile", leaderDescription: "Really cool guy!", description: "We will surf and it will be so much fun trust us!!!", location: "Somewhere with gnar waves", tripMembers: [])
    
    let surfing2 = Trip(title: "Surfing 2", imageName: "surfing2pic", leaderName: "Tom Hanks", leaderImageName: "tomhanks", leaderDescription: "Really cool guy!", description: "We will surf better than surfing 1 and it will be so much fun trust us!!!", location: "Somewhere with more gnar waves", tripMembers: [])
    


    
    
}