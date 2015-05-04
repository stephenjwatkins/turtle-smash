//
//  SettingsManager.swift
//  Turtle Smash
//
//  Created by Stephen Watkins on 1/20/15.
//  Copyright (c) 2015 Stephen Watkins. All rights reserved.
//

import Foundation

class SettingsManager {
    
    class func get(key: String) -> AnyObject? {
        return NSUserDefaults.standardUserDefaults().valueForKey(key)
    }
    
    class func set(key: String, value: AnyObject) {
        NSUserDefaults.standardUserDefaults().setValue(value, forKey: key)
    }
    
}