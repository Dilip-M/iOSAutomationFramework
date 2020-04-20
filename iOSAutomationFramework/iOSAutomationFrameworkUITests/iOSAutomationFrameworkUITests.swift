//
//  iOSAutomationFrameworkUITests.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 18/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.
//
/*
import XCTest

class iOSAutomationFrameworkUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

*/

///
///IGNORE THIS CLASS
///

///
///THIS CLASS CONTAINS THE RAW COPY OF ALL RUNNING TESTS in the test framework - before refactoring.
///


import XCTest

class iOSAutomationFrameworkUITests: XCTestCase {
    
    let appStore = XCUIApplication(bundleIdentifier: "com.apple.AppStore")
    let twitterApp = XCUIApplication(bundleIdentifier: "com.atebits.Tweetie2")
    let springBoard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
    }
    
    override func tearDown() {
        appStore.terminate()
        //twitter uninstall app
        //twitter page unfollow
        //twitter log out
        //delete tweeted post
    }
    
    func testInstallTwitterApp() {
        appStore.launch()
        appStore.tabBars.buttons["Search"].tap()
        appStore.navigationBars["Search"].searchFields["Games, Apps, Stories and More"].tap()
        appStore.navigationBars["Search"].typeText("Twitter")
        appStore.buttons["search"].tap()
        
        let twitterInAppStore = appStore.collectionViews.cells["Twitter, Live news, sports, and chat, four and a half stars, 147K ratings"]
        
        twitterInAppStore.waitForExistence(timeout: 3000)
        let openTwitterInAppStore = twitterInAppStore.buttons["open"]
        
        if(twitterInAppStore.buttons["get"].exists) {
            twitterInAppStore.buttons["get"].tap()
            springBoard.buttons["Install"].waitForExistence(timeout: 3000)
            springBoard.buttons["Install"].tap()
            openTwitterInAppStore.waitForExistence(timeout: 30000)
            openTwitterInAppStore.tap()
        }
        else if(twitterInAppStore.buttons["re-download"].exists) {    //working
            twitterInAppStore.buttons["re-download"].tap()
            openTwitterInAppStore.waitForExistence(timeout: 30000)
            openTwitterInAppStore.tap()
        }
        else {
            openTwitterInAppStore.tap()  //working
        }
    }
    
    func testLogin() {
        twitterApp.launchEnvironment = ["animations": "0"]
        //twitterApp.launch()
        
        let logInLink = twitterApp.otherElements["Have an account already? Log in"]
        XCTAssertTrue(logInLink.waitForExistence(timeout: 3000))
        logInLink.tap()
        
        let usernameField = twitterApp.collectionViews.textFields["Phone, email or username"]
        usernameField.typeText("suparna37552739") //suparna3107+testaccount1@gmail.com //suparna3107
        
        let passwordField = twitterApp.collectionViews.cells.secureTextFields["Password"]
        passwordField.tap()
        passwordField.typeText("Suparna123@")  //Suparna123
        
        let signInButton = twitterApp.toolbars["Toolbar"].buttons["LogIn Action"]
        XCTAssertTrue(signInButton.waitForExistence(timeout: 2000) && signInButton.isHittable)
        signInButton.tap()
    }
    
    func testSearchFlow() {
        twitterApp.otherElements["Moments_tab"].tap()
        twitterApp.navigationBars["kTFNNavigationBarAXIdentifier"].searchFields["SearchTextField"].tap()
        twitterApp.typeText("Twitter India")
        twitterApp.buttons["Search"].tap()
        followAndVerify()
    }
    
    func followAndVerify() {
        let peopleTab = twitterApp.buttons["People"]
        peopleTab.waitForExistence(timeout: 3000)
        peopleTab.tap()
        
        if (twitterApp.tables["URT Table"].cells.firstMatch.label=="Loading…") {
            twitterApp.tables["URT Table"].cells.firstMatch.waitForExistence(timeout: 30000)
        }
        
        twitterApp.tables["URT Table"].cells.buttons["FollowButton"].waitForExistence(timeout: 30000)
        twitterApp.tables["URT Table"].cells.firstMatch.buttons["FollowButton"].tap()
        twitterApp.tables.cells.firstMatch.tap() ///go to page
        let isFollowing = twitterApp.buttons["FollowButton"].firstMatch.label ///Following Twitter India

        XCTAssertTrue(twitterApp
            .staticTexts["ProfileHeaderBio"].label
            .contains("ट्विटर - The official Twitter India account."))
        
        XCTAssertEqual("Following Twitter India", isFollowing, "not following Twitter")
    }
    
    func testUnfollow() {
        
    }
    
    func testTweetPost() {
        twitterApp.otherElements["Timelines_tab"].tap()
        twitterApp.buttons["Compose Tweet"].tap()
        twitterApp.typeText("Tweet India Tweet & end corona @TwitterIndia #TwitterIndia ")
        twitterApp.buttons["PhotoGalleryButton"].tap()
        twitterApp.collectionViews.cells["PhotoGalleryCell1"].otherElements["Portrait. Photo"].tap()
        twitterApp.navigationBars["kTFNNavigationBarAXIdentifier"].buttons["Add"].tap()
        twitterApp.navigationBars["kTFNNavigationBarAXIdentifier"].buttons["ComposeSendTweetButton"].tap()
        sleep(2)
        
        let newPost = twitterApp.cells.containing(NSPredicate(format: "label CONTAINS %@", "suparna. Tweet India Tweet & end corona @TwitterIndia  hash tag TwitterIndia. Image. ")).element
        
        XCTAssertTrue(newPost.waitForExistence(timeout: 20000))
        
       // twitterApp.cells.containing(NSPredicate(format: "label CONTAINS %@", "suparna. Tweet India Tweet & end corona @TwitterIndia  hash tag TwitterIndia. Image. ")).element.firstMatch.tap()
        
       // let imageInGalleryView = twitterApp.otherElements.containing(NSPredicate(format: "identifier ENDSWITH %@", ".jpg")).element.exists
        
        //twitterApp.buttons["CloseButton"].tap()
        
        //let tweetPosted = twitterApp.tables["TweetDetails Table"].textViews.containing(NSPredicate(format: "value CONTAINS %@", "Tweet India Tweet")).element
    
        //let imageDisplayed = twitterApp.tables["TweetDetails Table"].images["TappableImageView0"]
        
        //XCTAssertTrue(tweetPosted.exists && imageDisplayed.exists, "Tweeted Image and post is not displayed")
    }
    
    func testTweetIsPosted() {
        
        twitterApp.otherElements["Moments_tab"].tap()
        twitterApp.navigationBars["kTFNNavigationBarAXIdentifier"].searchFields["SearchTextField"].tap()
        
        twitterApp.typeText("#TwitterIndia")
        twitterApp.buttons["Search"].tap()
        
        let latestTab = twitterApp.collectionViews.buttons["Latest"]
        latestTab.waitForExistence(timeout: 3000)
        latestTab.tap()
        
        twitterApp.scrollViews.tables.cells.containing(NSPredicate(format: "label CONTAINS %@", "suparna. Tweet India Tweet & end corona @TwitterIndia  hash tag TwitterIndia. Image. ")).element.firstMatch
        
        twitterApp.scrollViews.tables.cells.containing(NSPredicate(format: "label CONTAINS %@", "suparna. Tweet India Tweet & end corona @TwitterIndia  hash tag TwitterIndia. Image. ")).element.firstMatch.tap()
        
        let imageInGalleryView = twitterApp.otherElements.containing(NSPredicate(format: "identifier ENDSWITH %@", ".jpg")).element.exists
            
        twitterApp.buttons["CloseButton"].tap()
            
        let tweetPosted = twitterApp.scrollViews.tables.cells.containing(NSPredicate(format: "label CONTAINS %@", "suparna. Tweet India Tweet & end corona @TwitterIndia  hash tag TwitterIndia. Image. ")).element.firstMatch
            
        XCTAssertTrue(tweetPosted.exists, "Tweeted Image and post is not displayed")
    }
    

    func pulltorefresh() {
       /* let firstCell = app.tables.cells.firstMatch
      let start = firstCell.coordinate(withNormalizedOffset: (0, 0))
      let finish = firstCell.coordinate(withNormalizedOffset: (0, 6))
      start.press(forDuration: 0, thenDragTo: finish)*/
    }
    
    func testSignUp() {
        let app = twitterApp
        //app.launch()
        app.buttons["Create account"].tap()
        app.typeText("suparna")
        app.buttons["Return"].tap()
        app.typeText("9113995653")
        
        let toolbar = app.toolbars["Toolbar"]
        let nextButton = toolbar.buttons["Next"]
        nextButton.tap()
        nextButton.tap()
        
        app.collectionViews["CombinedSignUpReview Table"].buttons["Sign up"].tap()
        app.alerts["Verify phone"].scrollViews.otherElements.buttons["OK"].tap()
        sleep(1000)
        
        //otp
    
        let skipForNowButton = toolbar.buttons["Skip for now"]
        skipForNowButton.tap()
        skipForNowButton.tap()
    }
}

