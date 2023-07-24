//
//  CaloriesAppTests.swift
//  CaloriesAppTests
//
//  Created by Данила on 24.07.2023.
//

import XCTest
@testable import CaloriesApp
final class CaloriesAppTests: XCTestCase {

    var weight: WeightViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        weight = WeightViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        weight = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let size = "5050"
        let size2 = "50.50"
        
        XCTAssertEqual(weight.goodSize(text: size), 30)
        XCTAssertEqual(weight.goodSize(text: size2), 24)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
