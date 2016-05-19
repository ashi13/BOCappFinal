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
    
    init?(firstName: String, lastName: String, imageName: String, classYear: Int, isLeader: Bool){
        
        self.firstName = firstName
        self.lastName = lastName
        
        self.imageName = imageName
        self.image = UIImage(named: imageName)
        
        self.classYear = classYear
        
        self.isLeader = isLeader
    }
}