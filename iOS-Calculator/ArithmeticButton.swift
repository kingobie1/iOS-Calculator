//
//  ArithmeticButton.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/24/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class ArithmeticButton: UIButton {

    // Mark: Properties
    var colorManager = ColorManager.sharedInstance
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let squareDimension: CGFloat = screenSize.width / 4
        
        let buttonColor = colorManager.getColor(ColorType.ArithmeticButton)
        let textColor = colorManager.getColor(ColorType.Text)
        
        let path = UIBezierPath(rect: CGRectMake(0,0,squareDimension,squareDimension))
        
        buttonColor.setFill()
        
        setTitleColor(textColor, forState: UIControlState.Normal)
        
        path.fill()
    }
}
