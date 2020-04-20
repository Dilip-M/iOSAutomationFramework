//
//  XCUIElement+ClearAndEnterText.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

extension XCUIElement {
    
    func clearAndEnterText(text: String) -> Void {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        self.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).tap()

        var deleteString: String = ""
        for _ in stringValue {
            deleteString += "\u{8}"
        }
        self.typeText(deleteString)

        self.typeText(text)
    }

    func deleteCharacter() {
        self.typeText("\u{8}")
    }
    
    
}
