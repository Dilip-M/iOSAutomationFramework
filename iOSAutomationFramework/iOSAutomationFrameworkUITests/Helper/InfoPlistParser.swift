//
//  InfoPlistParser.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import Foundation

struct InfoPlistParser {
    static func getStringValue(forKey key:String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String else {
         fatalError("Could not find value for key \(key) in the Info.plist")
        }
        return value
    }
}
