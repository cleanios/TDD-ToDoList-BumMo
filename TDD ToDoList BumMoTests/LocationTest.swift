//
//  LocationTest.swift
//  TDD ToDoList BumMoTests
//
//  Created by BumMo Koo on 13/05/2019.
//  Copyright © 2019 gbmksquare. All rights reserved.
//

import XCTest
import CoreLocation
@testable import TDD_ToDoList_BumMo

class LocationTest: XCTestCase {
    // MARK: - Setup
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    // MARK: - Test
    func testEqualLocations_ShouldBeEqual() {
        let coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let first = TodoLocation(name: "Home", coordinate: coordinate)
        let second = TodoLocation(name: "Home", coordinate: coordinate)
        XCTAssertEqual(first, second)
    }
    
    func testWhenLatitudeDiffers_ShouldNotBeEqual() {
        let coordinate1 = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let coordinate2 = CLLocationCoordinate2D(latitude: 1, longitude: 0)
        let first = TodoLocation(name: "Home", coordinate: coordinate1)
        let second = TodoLocation(name: "Home", coordinate: coordinate2)
        XCTAssertNotEqual(first, second)
    }
    
    func testWhenLongitudeDiffers_ShouldNotBeEqual() {
        let coordinate1 = CLLocationCoordinate2D(latitude: 0, longitude: 1)
        let coordinate2 = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let first = TodoLocation(name: "Home", coordinate: coordinate1)
        let second = TodoLocation(name: "Home", coordinate: coordinate2)
        XCTAssertNotEqual(first, second)
    }
}
