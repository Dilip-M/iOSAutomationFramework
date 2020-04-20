//
//  AppStoreSearchScreenWrapper.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 19/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//

import XCTest

class AppStoreSearchScreenWrapper {

    let appNameCells: XCUIElementQuery
    let installButton: XCUIElement
 
    init (app: XCUIApplication) {
       
        appNameCells = app.collectionViews.cells
        installButton = app.buttons["Install"]
               
     }

}
