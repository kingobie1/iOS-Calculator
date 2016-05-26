//
//  NumericalButton.swift
//  iOS-Calculator
//
//  Found on http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class NumericalButton: UIButton {
    
    // Mark: Properties
    var colorManager = ColorManager.sharedInstance
    let screenSize: CGRect = UIScreen.mainScreen().bounds

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let squareDimension: CGFloat = screenSize.width / 4
        
        let buttonColor = colorManager.getColor(ColorType.NumericalButton)
        let textColor = colorManager.getColor(ColorType.Text)
        
//        var path = UIBezierPath(ovalInRect: rect)
        let path = UIBezierPath(rect: CGRectMake(0,0,squareDimension,squareDimension))
        
        buttonColor.setFill()
        
        setTitleColor(textColor, forState: UIControlState.Normal)
        
        path.fill()
    }
}
