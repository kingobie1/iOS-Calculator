//
//  Settings.swift
//  iOS-Calculator
//
//  Created by Obatola Seward-Evans on 5/26/16.
//  Copyright © 2016 Obatola Seward-Evans. All rights reserved.
//

import UIKit

/// For now has no functionality.
class Settings: NSObject, NSCoding {
    
    // MARK: Properties
    
    var colorTheme: ColorTheme
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("settings")
    
    
    // MARK: Types
    
    struct PropertyKey {
        static let themeKey = "theme"
    }
    
    
    // MARK: Initializer
    
    init?(colorTheme: ColorTheme) {
        // Initialize stored properties.
        self.colorTheme = colorTheme
        
        super.init()
    }
    
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(colorTheme.rawValue, forKey: PropertyKey.themeKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let colorThemeRawValue = aDecoder.decodeObjectForKey(PropertyKey.themeKey) as! ColorTheme.RawValue
        let colorTheme = ColorTheme(rawValue: colorThemeRawValue)
        
        self.init(colorTheme: colorTheme!)
    }
}
