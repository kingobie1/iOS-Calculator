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
    private var colorTheme: ColorTheme = ColorTheme.Dark
    
    func getColorTheme() -> ColorTheme {
        return colorTheme
    }
    
    func setColorTheme(theme: ColorTheme){
        colorTheme = theme
    }
    
    func getColor(colorType: ColorType) -> UIColor {
        switch colorTheme {
        case .Dark:
            if let color = darkTheme[colorType]  {
                return color
            }
        case .Light:
            if let color = lightTheme[colorType]  {
                return color
            }
        case .Blue:
            if let color = blueTheme[colorType]  {
                return color
            }
        case .StepChampion:
            if let color = stepChampionTheme[colorType]  {
                return color
            }
        }
        
        // if no color exists
        return UIColor.blueColor()
    }
    
    private var lightTheme: Dictionary < ColorType, UIColor > = [
        .ArithmeticButton:      UIColor(netHex: 0xffffff),
        .Background:            UIColor(netHex: 0xffffff),
        .ButtonHighlight:       UIColor(netHex: 0xcadee1),
        .Default:               UIColor(netHex: 0xffffff),
        .EqualButton:           UIColor(netHex: 0xcadee1),
        .NumericalButton:       UIColor(netHex: 0xffffff),
        .StatusBarBlock:        UIColor(netHex: 0xffffff),
        .Text:                  UIColor(netHex: 0x262626),
        ]
    
    private var darkTheme: Dictionary < ColorType, UIColor > = [
        .ArithmeticButton:      UIColor(netHex: 0x1e1e1e),
        .Background:            UIColor(netHex: 0x050505),
        .ButtonHighlight:       UIColor(netHex: 0x050505),
        .Default:               UIColor(netHex: 0x000000),
        .EqualButton:           UIColor(netHex: 0xc0392b),
        .NumericalButton:       UIColor(netHex: 0x2b2b2b),
        .StatusBarBlock:        UIColor(netHex: 0x151515),
        .Text:                  UIColor(netHex: 0xede8ec),
        ]
    
    private var blueTheme: Dictionary < ColorType, UIColor > = [
        .ArithmeticButton:      UIColor(netHex: 0x217d90),
        .Background:            UIColor(netHex: 0x082a35),
        .ButtonHighlight:       UIColor(netHex: 0x082a35),
        .Default:               UIColor(netHex: 0x000000),
        .EqualButton:           UIColor(netHex: 0xf09de3),
        .NumericalButton:       UIColor(netHex: 0x2eacc6),
        .Text:                  UIColor(netHex: 0xbaf9fe),
        ]
    
    private var stepChampionTheme: Dictionary < ColorType, UIColor > = [
        .ArithmeticButton:      UIColor(netHex: 0x8bc5f2),
        .Background:            UIColor(netHex: 0x35495d),
        .ButtonHighlight:       UIColor(netHex: 0x35495d),
        .Default:               UIColor(netHex: 0x000000),
        .EqualButton:           UIColor(netHex: 0x587490),
        .NumericalButton:       UIColor(netHex: 0xaed6f1),
        .Text:                  UIColor(netHex: 0xffffff), // 0xe4f1fd)
        ]
}