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
        let currentTime = "2021-03-18 00:00:00"
//        let currentTime = Date.init()
        let climateModel = ClimateModel(timeStamp: currentTime, temperature: 19.6, humidity: 99.1, location: "Office")
        
        XCTAssert(climateModel.location == "Office")
        XCTAssert(climateModel.timeStamp == currentTime)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
//        self.measure {
            // Put the code you want to measure the time of here.
//        }
    }
    
    func testJSONdecoderSingleRecord() throws {
        // Test the JSON Decoder

        var climateManager = ClimateManager()
        let testData = climateManager.loadJSON("Data/sampleDataOneRecord")!
        let climateModel = climateManager.parseJSON(testData)
        
        XCTAssert(climateModel![0].temperature == 20.0)
    }
    
    func testJSONDecoder() throws {
        var climateManager = ClimateManager()
        let testData = climateManager.loadJSON("Data/sampleData")
        let climateModel = climateManager.parseJSON(testData!)
        
        XCTAssert(climateModel!.count == 21)
    }

}
