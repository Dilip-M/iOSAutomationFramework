//
//  TwitterLogInScreen.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class TwitterLogInScreen: XCTestCase {
 
    func login(userNameTextField : XCUIElement,passwordTextField: XCUIElement,logInButton: XCUIElement,userName : String,password: String) {
        waitForElementToExist(element: passwordTextField, timeout: 10)
        userNameTextField.clearAndEnterText(text: userName)
        passwordTextField.clearAndEnterText(text: password)
        logInButton.tap()
    }
}

