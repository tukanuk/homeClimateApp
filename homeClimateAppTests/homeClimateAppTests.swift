//
//  homeClimateAppTests.swift
//  homeClimateAppTests
//
//  Created by Benjamin Davidson on 2021-04-11.
//

import XCTest
@testable import homeClimateApp

class homeClimateAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert("Test" == "Test")

    }
    
    func testClimateData() throws {
        // Test the ClimateData object
        let currentTime = Date.init()
        let climateData = ClimateData(timeStamp: currentTime, temperature: 19.6, humidity: 99.1, location: ClimateLocation(name: "Office", latitude: 44.1, longitude: 44.1 ))
        
        XCTAssert(climateData.location.name == "Office")
        XCTAssert(climateData.timeStamp == currentTime)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
