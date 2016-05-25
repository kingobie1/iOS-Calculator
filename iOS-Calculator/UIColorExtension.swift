//
//  UIColorExtension.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/24/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    class func numericButtonColor() -> UIColor {
        return UIColor(netHex:0x2b2b2b)
    }
    
    class func arithmeticButtonColor() -> UIColor {
        return UIColor(netHex:0x1e1e1e)
    }
    
    class func textColor() -> UIColor {
        return UIColor(netHex: 0xede8ec)
    }
    
    class func backgroundColor() -> UIColor {
        return UIColor(netHex:0x050505)
    }
    
    class func equalButtonColor() -> UIColor {
        return UIColor(netHex:0xc0392b)
    }
    

}