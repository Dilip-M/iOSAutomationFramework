//
//  AppStoreLaunchScreen.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 18/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class AppStoreLaunchScreenWrapper {

    let searchTabBarButton: XCUIElement
    let searchTextField: XCUIElement
    let searchButton: XCUIElement

    
    init (app: XCUIApplication) {
        searchTabBarButton = app.tabBars.buttons["Search"]
        
        searchTextField = app.navigationBars["Search"]
                        .searchFields["Games, Apps, Stories and More"]
                        .firstMatch
        
        searchButton = app.buttons["search"].firstMatch
    }

}
