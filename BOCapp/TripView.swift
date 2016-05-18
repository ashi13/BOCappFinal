//
//  TripView.swift
//  BOCapp
//
//  Created by Andrew Murowchick on 4/26/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

protocol TripViewDataSource : class {
    func getTripInfo() -> Trip?
}

class TripView: UIScrollView {

    weak var dataSource: TripViewDataSource?
    
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
