//
//  TwitterLogInScreenWrapper.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterLogInScreenWrapper {

    let userNameTextField: XCUIElement
    let passwordTextField: XCUIElement
    let logInButton: XCUIElement
 
    init (app: XCUIApplication) {
        userNameTextField = app.collectionViews
                        .textFields["Phone, email or username"]
                        .firstMatch
        passwordTextField = app.collectionViews
                        .cells.secureTextFields["Password"]
                        .firstMatch

        logInButton = app.toolbars["Toolbar"]
                        .buttons["LogIn Action"]
                        .firstMatch
     }
}
