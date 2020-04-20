//
//  TwitterHomeScreen.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterHomeScreen:XCTestCase {
  
    
    func allowNotification(allowButton: XCUIElement) -> TwitterHomeScreen {
        if allowButton.exists {
            allowButton.tap()
        }
        return TwitterHomeScreen()
    }
    
    func tapOnSearchButton(searchButton: XCUIElement) -> TwitterSearchScreen {
        waitForElementToExist(element: searchButton, timeout: 10)
        searchButton.tap()
        return TwitterSearchScreen()
    }
    
    func searchPage(searchButton: XCUIElement) -> TwitterHomeScreen {
        waitForElementToExist(element: searchButton, timeout: 10)
        searchButton.tap()
        return TwitterHomeScreen()
    }
    
    func tapOnNavigationBarDashButton(navigationBarDashButton: XCUIElement) -> TwitterUserSettingsScreen {
        waitForElementToExist(element: navigationBarDashButton, timeout: 10)
        navigationBarDashButton.tap()
        return TwitterUserSettingsScreen()
    }
    
    func tapOnComposeATweet(composeTweetButton : XCUIElement) -> TwitterTweetScreen {
        waitForElementToExist(element: composeTweetButton, timeout: 10)
        composeTweetButton.tap()
        return TwitterTweetScreen()
    }
    
    func verifyAndtapOnAImageInTweet(composedMessage : XCUIElement,closeButton:XCUIElement) {
        waitForElementToExist(element: composedMessage, timeout: 10)
        composedMessage.tap()
        waitForElementToExist(element: closeButton, timeout: 10)
        closeButton.tap()
         waitForElementToExist(element: composedMessage, timeout: 10)
    }
    
    func navigateToHome(homeButton : XCUIElement) -> TwitterHomeScreen {
        waitForElementToExist(element: homeButton, timeout: 10)
        homeButton.tap()
        return TwitterHomeScreen()
    }
    
}
