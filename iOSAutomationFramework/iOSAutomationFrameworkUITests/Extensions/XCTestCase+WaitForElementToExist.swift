//
//  XCTestCase+WaitForElementToExist.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

extension XCTestCase {
    func waitForElementToExist (element: XCUIElement, timeout: Double) {
        expectation(for: NSPredicate(format: "exists == true"), evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeout, handler: nil)
  }
}
