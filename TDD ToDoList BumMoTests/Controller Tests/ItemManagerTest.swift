//
//  ItemManagerTest.swift
//  TDD ToDoList BumMoTests
//
//  Created by BumMo Koo on 13/05/2019.
//  Copyright © 2019 gbmksquare. All rights reserved.
//

import XCTest
@testable import TDD_ToDoList_BumMo

class ItemManagerTest: XCTestCase {
    private var sut: ItemManager!
    
    // MARK: - Setup
    override func setUp() {
        sut = ItemManager()
    }
    
    override func tearDown() {
        
    }
    
    // MARK: - Test
    func testToDoCount_InitiallyZero() {
        XCTAssertEqual(sut.toDoCount, 0, "Initial todo count should be 0.")
    }
    
    func testDoneCount_InitiallyZero() {
        XCTAssertEqual(sut.doneCount, 0, "Initial done count should be 0.")
    }
    
    func testToDoCount_AfterAddingOneItem_IsOne() {
        let item = TodoItem(title: "Test Title")
        sut.add(item: item)
        XCTAssertEqual(sut.toDoCount, 1, "Todo count should be 1.")
    }
    
    func testItemAtIndex_ShouldReturnPreviouslyAddedItem() {
        let item = TodoItem(title: "Test Title")
        sut.add(item: item)
        
        let returned = sut.todoItem(at: 0)
        XCTAssertEqual(returned.title, item.title, "Should have same title.")
    }
    
    func testCheckingItem_ChangesCountOfToDoAndOfDoneItems() {
        let item = TodoItem(title: "First Item")
        sut.add(item: item)
        sut.checkItem(at: 0)
        
        XCTAssertEqual(sut.toDoCount, 0, "Todo count should be 0.")
        XCTAssertEqual(sut.doneCount, 1, "Done count should be 1.")
    }
    
    func testCheckingItem_RemovesItFromTheTodoItemList() {
        let first = TodoItem(title: "First")
        let second = TodoItem(title: "Second")
        
        sut.add(item: first)
        sut.add(item: second)
        sut.checkItem(at: 0)
        
        let returned = sut.todoItem(at: 0)
        XCTAssertEqual(returned.title, second.title)
    }
    
    func testDoneItemAtIndex_ShouldReturnPrevsioulyCheckedItem() {
        let item = TodoItem(title: "Title")
        sut.add(item: item)
        sut.checkItem(at: 0)
        
        let returned = sut.doneItem(at: 0)
        XCTAssertEqual(item.title, returned.title)
    }
    
    func testRemoveAllItems_ShouldResultInCountBeZero() {
        sut.add(item: TodoItem(title: "First"))
        sut.add(item: TodoItem(title: "Second"))
        sut.checkItem(at: 0)
        
        XCTAssertEqual(sut.toDoCount, 1)
        XCTAssertEqual(sut.doneCount, 1)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.toDoCount, 0)
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func testAddingSameItem_DoesntIncreaseCount() {
        sut.add(item: TodoItem(title: "Title"))
        sut.add(item: TodoItem(title: "Title"))
        XCTAssertEqual(sut.toDoCount, 1)
    }
}
