//
//  color.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/31/16.
//  Some code found on http://stackoverflow.com/questions/31542517/swift-change-button-background-color-and-image-color-while-pressed
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

class Color {
    class func imageWithColor(color: UIColor, size: CGSize = CGSizeMake(60, 60)) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
        
        return image;
    }
}