//
//  TrippersTableViewCell.swift
//  BOCapp
//
//  Created by Alexander Shi on 5/10/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class TrippersTableViewCell: UITableViewCell {

    @IBOutlet weak var tripperName: PaddingLabel!
    @IBOutlet weak var tripperImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
