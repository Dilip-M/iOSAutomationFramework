//
//  TwitterTweetScreen.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterTweetScreen: XCTestCase {
    func composeATweet(tweetTextView: XCUIElement,message: String,appln : XCUIApplication) -> TwitterTweetScreen {
        waitForElementToExist(element: tweetTextView, timeout: 10)
        appln.typeText(message)
        return TwitterTweetScreen()
    }
    
    func addImageToPost(galleryButton: XCUIElement,firstImage: XCUIElement,addButton:XCUIElement) -> TwitterTweetScreen {
        waitForElementToExist(element: galleryButton, timeout: 10)
        galleryButton.tap()
        waitForElementToExist(element: firstImage, timeout: 10)
        firstImage.tap()
        waitForElementToExist(element: firstImage, timeout: 10)
        addButton.tap()
        return TwitterTweetScreen()
      }
    
    func postATweet(postTweetButton: XCUIElement) -> TwitterHomeScreen {
         waitForElementToExist(element: postTweetButton, timeout: 10)
         postTweetButton.tap()
         return TwitterHomeScreen()
    }
}
