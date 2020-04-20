//
//  TwitterUserSettingsScreenWrapper.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterUserSettingsScreenWrapper {

    let settingsAndPrivacyLink: XCUIElement
    let accountLink: XCUIElement
    let logOutLink: XCUIElement
    let logOutButton: XCUIElement
    

    init (app: XCUIApplication) {
        settingsAndPrivacyLink = app.staticTexts["Settings and privacy"].firstMatch
        accountLink = app.staticTexts["Account"].firstMatch
        logOutLink = app.staticTexts["Log out"].firstMatch
        logOutButton = app.buttons["Log out"].firstMatch
    }
}
