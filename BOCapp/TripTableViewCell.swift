//
//  TripTableViewCell.swift
//  BOCapp
//
//  Created by Alexander Shi on 5/2/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var tripPicture: UIImageView!
    @IBOutlet weak var tripLocation: UILabel!
    @IBOutlet weak var leaderPicture: UIImageView!
    @IBOutlet weak var leaderName: UILabel!
    @IBOutlet weak var tripCapacity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
