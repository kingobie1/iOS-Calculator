//
//  ColorManager.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/26/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

// Singleton ColorManager
class ColorManager {
    static let sharedInstance = ColorManager()
    private var colorTheme: ColorTheme
    
    private init() {
        colorTheme = ColorTheme.Dark
    }
    
    // MARK: Public Functions
    
    func getColor(colorType: ColorType) -> UIColor {
        var color: UIColor
        
        switch colorTheme {
            
        case .Dark:
            color = getDarkColor(colorType)
            
        case .Light:
            color = getLightColor(colorType)
        }
        
        return color
    }
    
    func switchColorTheme() {
        if colorTheme == ColorTheme.Dark {
            colorTheme = ColorTheme.Light
        } else {
            colorTheme = ColorTheme.Dark
        }
    }
    
    // MARK: Helper Functions
    
    private func getDarkColor(colorType: ColorType) -> UIColor {
        switch colorType {
            
        case .ArithmeticButton:
            return UIColor(netHex:0x1e1e1e)
            
        case .Background:
            return UIColor(netHex:0x050505)
            
        case .Default:
            return UIColor(netHex: 0x000000)
            
        case .EqualButton:
            return UIColor(netHex:0xc0392b)
            
        case .NumericalButton:
            return UIColor(netHex:0x2b2b2b)
            
        case .StatusBarBlock:
            return UIColor(netHex: 0x151515)
            
        case .Text:
            return UIColor(netHex: 0xede8ec)
            
        }
    }
    
    private func getLightColor(colorType: ColorType) -> UIColor {
        switch colorType {
            
        case .ArithmeticButton:
            return UIColor(netHex:0xffffff)
            
        case .Background:
            return UIColor(netHex:0xffffff)
            
        case .Default:
            return UIColor(netHex: 0xffffff)
            
        case .EqualButton:
            return UIColor(netHex:0xcadee1)
            
        case .NumericalButton:
            return UIColor(netHex:0xffffff)
            
        case .StatusBarBlock:
            return UIColor(netHex: 0xffffff)
            
        case .Text:
            return UIColor(netHex: 0x262626)
        }
    }
    
}