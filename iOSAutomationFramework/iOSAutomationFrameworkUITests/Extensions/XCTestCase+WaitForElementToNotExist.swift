//
//  XCTestCase+WaitForElementToNotExist.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

extension XCTestCase {
    func waitForElementToNotExist (element: XCUIElement, timeout: Double) {
        expectation(for: NSPredicate(format: "exists == false"), evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeout, handler: nil)
    }
}
