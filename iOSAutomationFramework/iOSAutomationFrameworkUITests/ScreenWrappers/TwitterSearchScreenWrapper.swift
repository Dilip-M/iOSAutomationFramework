//
//  TwitterSearchScreenWrapper.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterSearchScreenWrapper {
 
    let searchTextField: XCUIElement
    let searchButton: XCUIElement
    let followButton: XCUIElement
    let unfollowButton: XCUIElement
    let pageSection:XCUIElement
    let pageName:XCUIElement
    let twitterPageName:XCUIElement
    let composedTweet:XCUIElement
    let twitterIndiaButton:XCUIElement
       
    
    init (app: XCUIApplication) {
        searchTextField = app.searchFields["SearchTextField"].firstMatch
        searchButton = app.buttons["Search"].firstMatch
        followButton = app.otherElements["T1ProfileHeaderViewController"].buttons["FollowButton"].firstMatch
        pageSection = app.buttons["T1AvatarImageView.103770785"].firstMatch
        pageName = app.staticTexts["Go to ⁦‪@TwitterIndia‬⁩"].firstMatch
        unfollowButton = app.tables["TFNMenuSheet Table"].cells.element(boundBy: 0).firstMatch
        twitterPageName = app.tables["SearchTypeahead Table"].cells.element(boundBy: 2).firstMatch
        composedTweet = app.scrollViews.tables.cells
                        .containing(NSPredicate(format: "label CONTAINS %@", TwitterData.verifyMessage))
                        .element.firstMatch
        twitterIndiaButton = app.tables["URT Table"].cells.firstMatch
    }
}
