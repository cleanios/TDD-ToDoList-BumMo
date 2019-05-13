//
//  ItemTest.swift
//  TDD ToDoList BumMoTests
//
//  Created by BumMo Koo on 29/04/2019.
//  Copyright © 2019 gbmksquare. All rights reserved.
//

import XCTest
import CoreLocation
@testable import TDD_ToDoList_BumMo

class ItemTest: XCTestCase {
    // MARK: - Setup
    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    
    // MARK: - Test
    func testNewItemWithTitle() {
        let title = "Test Title"
        let item = TodoItem(title: title)
        XCTAssertEqual(title, item.title)
        
    }
    
    func testNewItemWithTitleAndDescription() {
        let title = "Test Title"
        let description = "Test Description"
        let item = TodoItem(title: title, description: description)
        XCTAssertEqual(title, item.title)
        XCTAssertEqual(description, item.description)
    }
    
    func testNewItemWithTitleDescriptionAndTimestamp() {
        let title = "Test Title"
        let description = "Test Descriptionn"
        let timestamp = 0.0
        let item = TodoItem(title: title, description: description, timestamp: timestamp)
        XCTAssertEqual(title, item.title)
        XCTAssertEqual(description, item.description)
        XCTAssertEqual(timestamp, item.timestamp)
    }
    
    func testNewItemWithTitleDescriptionTimestampAndLocation() {
        let title = "Test Title"
        let description = "Test Descriptionn"
        let timestamp = 0.0
        
        let locationName = "Seoul"
        let latitude: Double = 120
        let longitude: Double = 60
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = TodoLocation(name: locationName, coordinate: coordinate)
        XCTAssertEqual(locationName, location.name)
        XCTAssertEqual(latitude, location.coordinate.latitude)
        XCTAssertEqual(longitude, location.coordinate.longitude)
        
        let item = TodoItem(title: title, description: description, timestamp: timestamp, location: location)
        XCTAssertEqual(title, item.title)
        XCTAssertEqual(description, item.description)
        XCTAssertEqual(timestamp, item.timestamp)
        XCTAssertEqual(location, item.location ?? nil)
    }
}
