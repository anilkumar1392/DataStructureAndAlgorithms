//
//  DataStructureAndAlgorithmsTests.swift
//  DataStructureAndAlgorithmsTests
//
//  Created by mac on 19/06/21.
//

import XCTest
@testable import DataStructureAndAlgorithms

class DataStructureAndAlgorithmsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_lineraSearch_withValidValue_returnsTure(){
        var arr = [1,2,3,4,5,6,7,8,9,10]
        let status = Linear.search(arr: &arr, item: 10)
        XCTAssertTrue(status)
    }

}
