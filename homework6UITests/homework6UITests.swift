//
//  homework6UITests.swift
//  homework6UITests
//
//  Created by cisstudent on 9/18/25.
//

import XCTest
@testable import homework6

final class homework6UITests: XCTestCase {
    
    var app: XCUIApplication!
    
    // Test that all 9 images are present on the screen.
        func testAllImagesExist() throws {
            for i in 1...9 {
                let imageName = "c\(i)"
                let imageItem = app.images["imageGridItem_\(imageName)"]
                
                // Assert that each image element exists.
                XCTAssertTrue(imageItem.exists, "The image item for '\(imageName)' should exist.")
            }
        }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
