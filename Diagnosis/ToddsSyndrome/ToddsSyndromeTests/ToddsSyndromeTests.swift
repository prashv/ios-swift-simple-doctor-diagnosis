//
//  ToddsSyndromeTests.swift
//  ToddsSyndromeTests
//
//  Created by Prashannth Vijayakumar on 10/05/16.
//  Copyright © 2016 Diagnosis. All rights reserved.
//

import XCTest
@testable import ToddsSyndrome

class ToddsSyndromeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testProbability() {
        let toddsSyndrome = ToddsSyndrome()
        XCTAssertEqual(toddsSyndrome.probability(age: 25, isMale: 0, hasMigraines: 0, usesDrugs: 0), 0, "Probability 0 %")
        XCTAssertEqual(toddsSyndrome.probability(age: 15, isMale: 0, hasMigraines: 0, usesDrugs: 0), 0, "Probability 25 %")
        XCTAssertEqual(toddsSyndrome.probability(age: 15, isMale: 1, hasMigraines: 0, usesDrugs: 0), 0, "Probability 50 %")
        XCTAssertEqual(toddsSyndrome.probability(age: 15, isMale: 1, hasMigraines: 1, usesDrugs: 0), 0, "Probability 75 %")
        XCTAssertEqual(toddsSyndrome.probability(age: 15, isMale: 1, hasMigraines: 1, usesDrugs: 1), 0, "Probability 100 %")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
