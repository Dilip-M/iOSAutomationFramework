//
//  TwitterHomeScreenWrapper.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterHomeScreenWrapper {

    let searchButton: XCUIElement
    let navigationBarDashButton: XCUIElement
    let homeButton:XCUIElement
    let composeTweetButton:XCUIElement
    let composedMessage:XCUIElement
    let closeButton:XCUIElement
    let searchPage:XCUIElement

    init (app: XCUIApplication) {
        searchButton = app.otherElements["Moments_tab"].firstMatch
        navigationBarDashButton = app.buttons["NavigationBarDashButton"].firstMatch
        homeButton = app.otherElements["Timelines_tab"].firstMatch
        composeTweetButton = app.buttons["Compose Tweet"].firstMatch
        composedMessage = app.cells
                        .containing(NSPredicate(format: "label CONTAINS %@", TwitterData.verifyMessage))
                        .element
        closeButton = app.buttons["CloseButton"].firstMatch
        searchPage = app.cells
            .containing(NSPredicate(format: "label CONTAINS %@", TwitterData.tweetedPage))
        .element
        
     }
}

