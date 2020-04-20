//
//  AppInstallation.swift
//  iOSAutomationFrameworkUITests
//
//  Created by Mani, Dilip on 18/04/20.
//  Copyright © 2020 Mani, Dilip. All rights reserved.

import XCTest

class AppInstallationTests: XCTestCase {

    let appStore = XCUIApplication(bundleIdentifier: "com.apple.AppStore")
    let springBoard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    let twitterApp = XCUIApplication(bundleIdentifier: "com.atebits.Tweetie2")
    
    var appStoreLaunchScreen: AppStoreLaunchScreenWrapper!
    var appStoreSearchScreen: AppStoreSearchScreenWrapper!
    var appStoreInstallScreen: AppStoreInstallScreenWrapper!
    var twitterLaunchScreen: TwitterLaunchScreenWrapper!
    var twitterLogInScreen: TwitterLogInScreenWrapper!
    var twitterHomeScreen: TwitterHomeScreenWrapper!
    var twitterUserSettingsScreen: TwitterUserSettingsScreenWrapper!
    var twitterSearchScreen: TwitterSearchScreenWrapper!
    var twitterTweetScreen: TwitterTweetScreenWrapper!
    
    override func setUp() {
        continueAfterFailure = false
        appStoreLaunchScreen = AppStoreLaunchScreenWrapper(app: appStore)
        appStoreSearchScreen = AppStoreSearchScreenWrapper(app: appStore)
        appStoreInstallScreen = AppStoreInstallScreenWrapper(app: springBoard)
        twitterLaunchScreen = TwitterLaunchScreenWrapper(app: twitterApp)
        twitterLogInScreen = TwitterLogInScreenWrapper(app: twitterApp)
        twitterHomeScreen = TwitterHomeScreenWrapper(app: twitterApp)
        twitterSearchScreen = TwitterSearchScreenWrapper(app: twitterApp)
        twitterUserSettingsScreen = TwitterUserSettingsScreenWrapper(app: twitterApp)
        twitterTweetScreen = TwitterTweetScreenWrapper(app: twitterApp)
        twitterApp.launchEnvironment = ["animations": "0"]
    }

    override func tearDown() {
        appStore.terminate()
        super.tearDown()
    }

    func test01_TnstallOrOpenTwitterFromAppStore() throws {
        appStore.launch()
        
        AppStoreLaunchScreen()
        .tapOnSearchButton(searchIcon: appStoreLaunchScreen.searchTabBarButton)
        
        .searchForApplication(searchTextField : appStoreLaunchScreen.searchTextField,
                                searchButton:appStoreLaunchScreen.searchButton,
                                searchText: AppStore.twitter)
        
        .openOrDownloadApplication(appName: appStoreSearchScreen.appNameCells,
                                   appTitle: AppStore.twitter,
                                   installButton: appStoreInstallScreen.installButton)
        
        .verifyTwitterAppLaunch(welcomeText:twitterLaunchScreen.welcomeText)
        
        .tapOnLogInLink(logInLink: twitterLaunchScreen.logInLink)
        
        .login(userNameTextField : twitterLogInScreen.userNameTextField,
               passwordTextField: twitterLogInScreen.passwordTextField,
               logInButton: twitterLogInScreen.logInButton,
               userName : TwitterData.userName,password: TwitterData.password)
        
        XCTAssertTrue(twitterHomeScreen.homeButton.waitForExistence(timeout: 10),
        "TnstallOrOpenTwitterFromAppStore Test Failed")
        
    }
    
    func test02_FollowTwitterIndiaPage() throws {
      twitterApp.launch()
        
        TwitterHomeScreen()
        .tapOnSearchButton(searchButton: twitterHomeScreen.searchButton)
        
        .searchPage(searchTextField:twitterSearchScreen.searchTextField,
                    searchButton:twitterSearchScreen.searchButton,
                    appln: twitterApp,
                    searchText: TwitterData.searchText)
         
        .navigateToTwitterIndiaPage(twitterIndiaButton: twitterSearchScreen.twitterIndiaButton)
        
        .followPage(followButton:twitterSearchScreen.followButton)
        
        XCTAssertTrue(twitterSearchScreen.followButton.label.contains("Following Twitter India"),
                      "FollowTwitterIndiaPage Test Failed")
     }
    
    func test03_PostAndVerifyTwitterTweet() throws {
      twitterApp.launch()
        
        TwitterHomeScreen()
        
        .navigateToHome(homeButton : twitterHomeScreen.homeButton)
            
        .tapOnComposeATweet(composeTweetButton:twitterHomeScreen.composeTweetButton)
        
        .addImageToPost(galleryButton: twitterTweetScreen.galleryButton,
                    firstImage: twitterTweetScreen.firstImage,
               addButton: twitterTweetScreen.addButton)
        .composeATweet(tweetTextView: twitterTweetScreen.tweetTextView,message: TwitterData.message,appln : twitterApp)
        
        .postATweet(postTweetButton: twitterTweetScreen.postTweetButton)
         
        .verifyAndtapOnAImageInTweet(composedMessage: twitterHomeScreen.composedMessage,closeButton: twitterHomeScreen.closeButton)
        
        XCTAssertTrue(twitterSearchScreen.composedTweet.label.contains(TwitterData.verifyMessage),"PostAndVerifyTwitterTweet Test Failed")
    }
    
    
     func test04_VerifyTweetInTwitterIndiaPage() throws {
        twitterApp.launch()
        
        TwitterHomeScreen()
        
        .tapOnSearchButton(searchButton: twitterHomeScreen.searchButton)
        .searchPage(searchTextField:twitterSearchScreen.searchTextField,
                    searchButton:twitterSearchScreen.searchButton,
                    appln: twitterApp,
                    searchText: TwitterData.searchText)
        
        .verifyTweetedPostInTwitterIndiaPage(composedTweet: twitterSearchScreen.composedTweet)
        
        XCTAssertTrue(twitterSearchScreen.composedTweet.label.contains(TwitterData.verifyMessage),"VerifyTweetInTwitterIndiaPage Test Failed")
    }
    
     func test05_UnFollowTwitterIndiaPage() throws {
       twitterApp.launch()
        
        TwitterHomeScreen()
        
        .tapOnSearchButton(searchButton: twitterHomeScreen.searchButton)
            
        .searchPage(searchTextField:twitterSearchScreen.searchTextField,
                    searchButton:twitterSearchScreen.searchButton,
                    appln: twitterApp,
                    searchText: TwitterData.searchText)
         
        .navigateToTwitterIndiaPage(twitterIndiaButton: twitterSearchScreen.twitterIndiaButton)
        
        .unfollowPage(followButton:twitterSearchScreen.followButton,unfollowButton:twitterSearchScreen.unfollowButton)
        
       XCTAssertTrue(twitterSearchScreen.followButton.label.contains("Follow"),"UnFollowTwitterIndiaPage Test Failed")
        
    }
    
    func test06_logoutFromTwitter() throws {
       twitterApp.launch()
       
       TwitterHomeScreen()
        
        .navigateToHome(homeButton : twitterHomeScreen.homeButton)
        
        .tapOnNavigationBarDashButton(navigationBarDashButton: twitterHomeScreen.navigationBarDashButton)
        
        .tapOnSettingsAndPrivacy(settingsAndPrivacyLink: twitterUserSettingsScreen.settingsAndPrivacyLink)
        
        .tapOnAccount(accountLink: twitterUserSettingsScreen.accountLink)
        
        .userLogout(logOutLink: twitterUserSettingsScreen.logOutLink,
                    logOutButton: twitterUserSettingsScreen.logOutButton,
                    welcomeText: twitterLaunchScreen.welcomeText)
        
        XCTAssertTrue(twitterLaunchScreen.welcomeText.label.contains(TwitterData.welcomeText),
        "logoutFromTwitter Test Failed")
    }
    
}
