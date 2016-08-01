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
    var buttonColor: UIColor?
    var highlightColor: UIColor?
    var textColor: UIColor?

    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        
        initColor()
        
        self.setBackgroundImage(Color.imageWithColor(buttonColor!), forState: UIControlState.Normal)
        self.setBackgroundImage(Color.imageWithColor(highlightColor!), forState: UIControlState.Highlighted)
        
        self.setTitleColor(textColor, forState: UIControlState.Normal)

    }
    
    
    // MARK: Helper Functions
    
    /// Set colors.
    private func initColor() {
        buttonColor = colorManager.getColor(ColorType.NumericalButton)
        highlightColor = colorManager.getColor(ColorType.Background)
        textColor = colorManager.getColor(ColorType.Text)
    }
}
