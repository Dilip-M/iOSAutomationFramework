//
//  XCUIElement+SwipeUp.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

extension XCUIElement {
    
    func swipeUntillElementVisible(to element: XCUIElement) {
        while !element.exists {
            swipeUp()
        }
    }
}
