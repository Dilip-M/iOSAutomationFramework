//
//  AppStoreInstallScreenWrapper.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class AppStoreInstallScreenWrapper {

    let installButton: XCUIElement
 
    init (app: XCUIApplication) {
        installButton = app.buttons["Install"]
     }

}
