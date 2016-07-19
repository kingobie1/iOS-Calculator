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
    var buttonColor: UIColor
    var highlightColor: UIColor
    var textColor: UIColor
    
    required init?(coder aDecoder: NSCoder) {
        buttonColor = colorManager.getColor(ColorType.ArithmeticButton)
        highlightColor = colorManager.getColor(ColorType.Background)
        textColor = colorManager.getColor(ColorType.Text)
        
        super.init(coder: aDecoder)

        self.setBackgroundImage(Color.imageWithColor(buttonColor), forState: UIControlState.Normal)
        self.setBackgroundImage(Color.imageWithColor(highlightColor), forState: UIControlState.Highlighted)
        
        self.setTitleColor(textColor, forState: UIControlState.Normal)
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        
        initColor()
        
        self.setBackgroundImage(Color.imageWithColor(buttonColor), forState: UIControlState.Normal)
        self.setBackgroundImage(Color.imageWithColor(highlightColor), forState: UIControlState.Highlighted)
        
        self.setTitleColor(textColor, forState: UIControlState.Normal)
    }
    
    
    // MARK: Helper Functions
    
    /// Set colors.
    private func initColor() {
        buttonColor = colorManager.getColor(ColorType.ArithmeticButton)
        highlightColor = colorManager.getColor(ColorType.Background)
        textColor = colorManager.getColor(ColorType.Text)
    }
}
