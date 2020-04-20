//
//  TwitterUserSettingsScreen.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterUserSettingsScreen:XCTestCase {
    
    func tapOnSettingsAndPrivacy(settingsAndPrivacyLink: XCUIElement)  -> TwitterUserSettingsScreen {
        waitForElementToExist(element: settingsAndPrivacyLink, timeout: 10)
        settingsAndPrivacyLink.tap()
        return self
    }
    
    func tapOnAccount(accountLink: XCUIElement)  -> TwitterUserSettingsScreen {
        waitForElementToExist(element: accountLink, timeout: 10)
        accountLink.tap()
        return self
    }
    
    
    func userLogout(logOutLink: XCUIElement,logOutButton: XCUIElement,welcomeText : XCUIElement)  {
        waitForElementToExist(element: logOutLink, timeout: 10)
        logOutLink.tap()
        waitForElementToExist(element: logOutLink, timeout: 5)
        logOutButton.tap()
        waitForElementToExist(element: welcomeText, timeout: 10)
    }
}

