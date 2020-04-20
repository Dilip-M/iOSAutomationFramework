//
//  AppStoreLaunchScreen.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 18/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.

import XCTest

class AppStoreLaunchScreen: XCTestCase {

    func tapOnSearchButton(searchIcon : XCUIElement) -> AppStoreSearchScreen {
        waitForElementToExist(element: searchIcon, timeout: 10)
        searchIcon.tap()
        return AppStoreSearchScreen()
    }
}
