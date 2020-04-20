//
//  TwitterSearchScreen.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterSearchScreen:XCTestCase {
    
    func searchPage(searchTextField : XCUIElement,searchButton: XCUIElement,appln :XCUIApplication,searchText: String) -> TwitterSearchScreen {
        waitForElementToExist(element: searchTextField, timeout: 10)
        searchTextField.tap()
        appln.typeText(searchText)
        waitForElementToExist(element: searchButton, timeout: 10)
        searchButton.tap()
        return TwitterSearchScreen()
    }
    
    func navigateToTwitterIndiaPage(twitterIndiaButton : XCUIElement) -> TwitterSearchScreen {
        waitForElementToExist(element: twitterIndiaButton, timeout: 10)
        twitterIndiaButton.tap()
        return TwitterSearchScreen()
    }
    
    func followPage(followButton : XCUIElement)  {
        waitForElementToExist(element: followButton, timeout: 10)
        if (followButton.label.contains("Follow")) {
             followButton.tap()
          waitForElementToExist(element: followButton, timeout: 10)
        }
    }
    
    func unfollowPage(followButton : XCUIElement,unfollowButton: XCUIElement) {
       waitForElementToExist(element: followButton, timeout: 10)
        if (followButton.label.contains("Following Twitter India")) {
            followButton.tap()
            waitForElementToExist(element: unfollowButton, timeout: 10)
            unfollowButton.tap()
            waitForElementToExist(element: followButton, timeout: 10)
        }
   }
    
    func navigateToHome(homeButton : XCUIElement)  {
        waitForElementToExist(element: homeButton, timeout: 10)
        homeButton.tap()
    }
    
    func verifyTweetedPostInTwitterIndiaPage(composedTweet : XCUIElement)  {
        waitForElementToExist(element: composedTweet, timeout: 100)
        
    }
    
    func navToTwitterIndiaPage(searchTextField: XCUIElement,twitterPageName: XCUIElement) -> TwitterSearchScreen {
        waitForElementToExist(element: searchTextField, timeout: 10)
        searchTextField.tap()
        waitForElementToExist(element: twitterPageName, timeout: 10)
        twitterPageName.tap()
        return TwitterSearchScreen()
    }
}

extension XCUIElement {
    
    func swipeUp(to element: XCUIElement) {
        while !element.exists {
            swipeUp()
        }
    }
}
