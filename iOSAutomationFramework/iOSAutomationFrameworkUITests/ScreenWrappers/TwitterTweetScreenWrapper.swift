//
//  TwitterTweetScreenWrapper.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterTweetScreenWrapper {

    let tweetTextView:XCUIElement
    let galleryButton:XCUIElement
    let firstImage:XCUIElement
    let addButton:XCUIElement
    let postTweetButton:XCUIElement
    
    
    init (app: XCUIApplication) {
        tweetTextView = app.textViews.firstMatch
        galleryButton = app.buttons["PhotoGalleryButton"].firstMatch
        firstImage = app.collectionViews.cells["PhotoGalleryCell1"]
                    .otherElements["Portrait. Photo"]
                    .firstMatch
        addButton = app.navigationBars["kTFNNavigationBarAXIdentifier"]
                    .buttons["Add"]
                    .firstMatch
        postTweetButton = app.navigationBars["kTFNNavigationBarAXIdentifier"]
                    .buttons["ComposeSendTweetButton"]
                    .firstMatch
    }
}
