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
    
    /// Returns the appropriate color of the requested color type. This functions know the color scheme.
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
    
    /// Alternates the colorScheme.
    func alternateColorTheme() {
        if colorTheme == ColorTheme.Dark {
            colorTheme = ColorTheme.Light
        } else {
            colorTheme = ColorTheme.Dark
        }
    }
    
    func setColorTheme(colorTheme: ColorTheme) {
        self.colorTheme = colorTheme
    }
    
    func getCurrentColorTheme() -> ColorTheme {
        return colorTheme
    }
    
    // MARK: Helper Functions
    
    /// Returns the appropriate color for the colorType in the DarkColorTheme.
    private func getDarkColor(colorType: ColorType) -> UIColor {
        switch colorType {
            
        case .ArithmeticButton:
            return UIColor(netHex:0x1e1e1e)
            
        case .Background:
            return UIColor(netHex:0x050505)
            
        case .ButtonHighlight:
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
    
    /// Returns the appropriate color for the colorType in the LightColorTheme.
    private func getLightColor(colorType: ColorType) -> UIColor {
        switch colorType {
            
        case .ArithmeticButton:
            return UIColor(netHex:0xffffff)
            
        case .Background:
            return UIColor(netHex:0xffffff)
            
        case .ButtonHighlight:
            return UIColor(netHex:0xcadee1)
            
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