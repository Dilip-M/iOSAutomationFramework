//
//  AppStoreSearchScreen.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class AppStoreSearchScreen: XCTestCase {
    
    func searchForApplication(searchTextField : XCUIElement,searchButton : XCUIElement,searchText: String) -> AppStoreSearchScreen {
        waitForElementToExist(element: searchTextField, timeout: 10)
        searchTextField.clearAndEnterText(text: searchText)
        waitForElementToExist(element: searchButton, timeout: 10)
        searchButton.tap()
        return self
    }
    
    func openOrDownloadApplication(appName:XCUIElementQuery,appTitle: String,installButton: XCUIElement) -> TwitterLaunchScreen {
        waitForElementToExist(element: appName.firstMatch, timeout: 10)
        var appNavigation = false
        for item in 0...appName.count {
            if(appName.element(boundBy: item).label.contains(appTitle)) {
                let actionButton = appName.element(boundBy: item).otherElements.buttons.element(boundBy: 1)
                let actionLabel = actionButton.label
                switch actionLabel {
                case "get":
                    actionButton.tap()
                    waitForElementToExist(element: installButton, timeout: 10)
                    installButton.tap()
                    let openButton = appName.element(boundBy: item).otherElements.buttons["open"].firstMatch
                    waitForElementToExist(element: openButton, timeout: 100)
                    if openButton.label.contains("open") {
                        openButton.tap()
                        appNavigation = true
                    }
                case "open":
                    actionButton.tap()
                    appNavigation = true
                case "re-download":
                    actionButton.tap()
                    let openButton = appName.element(boundBy: item).otherElements.buttons["open"].firstMatch
                    waitForElementToExist(element: openButton, timeout: 100)
                        if openButton.label.contains("open") {
                            openButton.tap()
                            appNavigation = true
                        }
                 default:
                   actionButton.tap()
                   appNavigation = true
                }
                if appNavigation {
                    break
                }
            }
        }
        return TwitterLaunchScreen()
     }
}


