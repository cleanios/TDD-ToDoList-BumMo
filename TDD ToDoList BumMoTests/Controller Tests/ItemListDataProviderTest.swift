//
//  ItemListDataProviderTest.swift
//  TDD ToDoList BumMoTests
//
//  Created by BumMo Koo on 13/05/2019.
//  Copyright © 2019 gbmksquare. All rights reserved.
//

import XCTest
@testable import TDD_ToDoList_BumMo

class ItemListDataProviderTest: XCTestCase {
    private var sut: ItemListDataProvider!
    private var tableView: UITableView!
    
    // MARK: - Setup
    override func setUp() {
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        tableView = UITableView()
        tableView.dataSource = sut
    }
    
    override func tearDown() {
        
    }
    
    // MARK: - Test
    func testNumberOfSections_IsTwo() {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testNumberOfRowsInFirstSection_IsToDoCount() {
        sut.itemManager?.add(item: TodoItem(title: "Title"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.add(item: TodoItem(title: "Title 2"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testNumberRowsInSecondSection_IsDoneCount() {
        sut.itemManager?.add(item: TodoItem(title: "First"))
        sut.itemManager?.add(item: TodoItem(title: "Second"))
        sut.itemManager?.checkItem(at: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.itemManager?.checkItem(at: 0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
}
