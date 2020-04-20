//
//  TwitterLaunchScreen.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterLaunchScreen: XCTestCase {
    
    func verifyTwitterAppLaunch(welcomeText : XCUIElement) -> TwitterLaunchScreen {
       waitForElementToExist(element: welcomeText, timeout: 10)
       return TwitterLaunchScreen()
    }
    
    func tapOnCreateAccount(createAccountButton : XCUIElement) -> TwitterCreateAccountScreen {
        waitForElementToExist(element: createAccountButton, timeout: 10)
        createAccountButton.tap()
        return TwitterCreateAccountScreen()
    }

    func tapOnLogInLink(logInLink : XCUIElement) -> TwitterLogInScreen {
        logInLink.tap()
        return TwitterLogInScreen()
    }
}
