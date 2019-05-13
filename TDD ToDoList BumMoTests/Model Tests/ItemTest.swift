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
    
    func testEqualItems_ShouldBeEqual() {
        let first = TodoItem(title: "Title")
        let second = TodoItem(title: "Title")
        XCTAssertEqual(first, second)
    }
    
    func testWhenLocationDiffers_ShouldBeNotEqual() {
        let coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let first = TodoItem(title: "Title", description: "Description", timestamp: 0, location: TodoLocation(name: "Home", coordinate: coordinate))
        let second = TodoItem(title: "Title", description: "Description", timestamp: 0, location: TodoLocation(name: "Office", coordinate: coordinate))
        XCTAssertNotEqual(first, second)
    }
    
    func testWhenOneLocationIsNilAndTheOtherIsnt_ShouldBeNotEqual() {
        let coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let first = TodoItem(title: "Title", description: "Description", timestamp: 0, location: TodoLocation(name: "Home", coordinate: coordinate))
        let second = TodoItem(title: "Title", description: "Description", timestamp: 0, location: nil)
        XCTAssertNotEqual(first, second)
    }
    
    func testWhenTimestampDiffers_ShouldBeNotEqual() {
        let first = TodoItem(title: "Title", description: "Description", timestamp: 0, location: nil)
        let second = TodoItem(title: "Title", description: "Description", timestamp: 1, location: nil)
        XCTAssertNotEqual(first, second)
    }
    
    func testWhenDescriptionDiffers_ShouldBeNotEqual() {
        let first = TodoItem(title: "Title", description: "Description 1", timestamp: 0, location: nil)
        let second = TodoItem(title: "Title", description: "Description 2", timestamp: 0, location: nil)
        XCTAssertNotEqual(first, second)
    }
    
    func testWhenTitleDiffers_ShouldBeNotEqual() {
        let first = TodoItem(title: "Title 1", description: "Description", timestamp: 0, location: nil)
        let second = TodoItem(title: "Title 2", description: "Description", timestamp: 0, location: nil)
        XCTAssertNotEqual(first, second)
    }
}
