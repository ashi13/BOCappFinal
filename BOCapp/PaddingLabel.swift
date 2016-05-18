//
//  PaddingLabel.swift
//  BOCapp
//
//  Created by Andrew Murowchick on 5/9/16.
//  Copyright © 2016 Alexander Shi. All rights reserved.
//

import UIKit

class PaddingLabel: UILabel {

    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, padding))
    }
    
    override func intrinsicContentSize() -> CGSize {
        let superContentSize = super.intrinsicContentSize()
        let width = superContentSize.width + padding.left + padding.right
        let height = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: height)
    }

    override func sizeThatFits(size: CGSize) -> CGSize {
        let superSizeThatFits = super.sizeThatFits(size)
        let width = superSizeThatFits.width + padding.left + padding.right
        let height = superSizeThatFits.height + padding.top + padding.bottom
        return CGSize(width: width, height: height)
    }
    
}
