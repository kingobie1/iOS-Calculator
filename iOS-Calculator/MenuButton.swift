//
//  MenuButton.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/26/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class MenuButton: UIButton {
    
    // Mark: Properties
    var colorManager = ColorManager.sharedInstance

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let ctx : CGContextRef = UIGraphicsGetCurrentContext()!
        
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMinY(rect))
        CGContextAddLineToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect))
        CGContextAddLineToPoint(ctx, (CGRectGetMaxX(rect)), CGRectGetMinY(rect))
        CGContextClosePath(ctx)
        
        colorManager.getColor(ColorType.EqualButton).setFill()
        
        CGContextFillPath(ctx);
        // Drawing code
    }


}
