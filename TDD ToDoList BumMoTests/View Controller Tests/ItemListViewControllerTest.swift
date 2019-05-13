//
//  ItemListViewControllerTest.swift
//  TDD ToDoList BumMoTests
//
//  Created by BumMo Koo on 13/05/2019.
//  Copyright © 2019 gbmksquare. All rights reserved.
//

import XCTest
@testable import TDD_ToDoList_BumMo

class ItemListViewControllerTest: XCTestCase {
    private var sut: ItemListViewController!
    
    // MARK: - Setup
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as? ItemListViewController
        _ = sut.view
    }
    
    override func tearDown() {
        
    }
    
    // MARK: - Test
    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testViewDidLoad_ShouldSetTableViewDataSource() {
        XCTAssertNotNil(sut.tableView?.dataSource)
        XCTAssertTrue(sut.tableView?.dataSource is ItemListDataProvider)
    }
    
    func testViewDidLoad_ShouldSetTableViewDelegate() {
        XCTAssertNotNil(sut.tableView?.delegate)
        XCTAssertTrue(sut.tableView?.delegate is ItemListDataProvider)
    }
    
    func testViewDidLoad_ShouldSetDelegateAndDataSourceToTheSameObject() {
        XCTAssertEqual(sut.tableView?.dataSource as? ItemListDataProvider, sut.tableView?.delegate as? ItemListDataProvider)
    }
}
