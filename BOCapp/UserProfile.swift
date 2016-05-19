//
//  UserProfile.swift
//  BOCapp
//
//  Created by Andrew Murowchick on 5/9/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import Foundation
import UIKit

class UserProfile {

    var isLeader: Bool
    
    var firstName: String
    var lastName: String
    
    var imageName: String
    var image: UIImage?
    
    var classYear: Int
    
    var trips = [Trip]()
    
    init() {
        
        self.firstName = ""
        self.lastName = ""
        
        self.imageName = "stockUserPicture"
        self.image = UIImage(named: "stockUserPicture")
        
        self.classYear = 2000
        
        self.isLeader = false
    }
    
    init(firstName: String, lastName: String, classYear: Int, isLeader: Bool){
        
        self.firstName = firstName
        self.lastName = lastName
        
        self.imageName = "stockUserPicture"
        self.image = UIImage(named: "stockUserPicture")
        
        self.classYear = classYear
        
        self.isLeader = isLeader
    }
    
    init?(firstName: String, lastName: String, imageName: String, classYear: Int, isLeader: Bool){
        
        self.firstName = firstName
        self.lastName = lastName
        
        self.imageName = imageName
        self.image = UIImage(named: imageName)
        
        self.classYear = classYear
        
        self.isLeader = isLeader
    }
}