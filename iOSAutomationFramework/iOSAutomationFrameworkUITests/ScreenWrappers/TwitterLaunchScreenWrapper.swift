//
//  TwitterLaunchScreenWrapper.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterLaunchScreenWrapper {

    let createAccountButton: XCUIElement
    let logInLink: XCUIElement
    let welcomeText: XCUIElement
    
    init (app: XCUIApplication) {
        welcomeText = app.staticTexts["See what’s happening in the world right now."]
                        .firstMatch
        createAccountButton = app.buttons["Create account"].firstMatch
        logInLink = app.otherElements["Have an account already? Log in"].firstMatch
     }

}
