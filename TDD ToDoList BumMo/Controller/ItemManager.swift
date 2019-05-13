//
//  ItemManager.swift
//  TDD ToDoList BumMo
//
//  Created by BumMo Koo on 13/05/2019.
//  Copyright © 2019 gbmksquare. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoCount: Int { return todoItems.count }
    var doneCount: Int { return doneItems.count }
    
    private var todoItems = [TodoItem]()
    private var doneItems = [TodoItem]()
    
    // MARK: Items
    func todoItem(at index: Int) -> TodoItem {
        return todoItems[index]
    }
    
    func doneItem(at index: Int) -> TodoItem {
        return doneItems[index]
    }
    
    // MARK: - Action
    func add(item: TodoItem) {
        guard todoItems.contains(item) == false else { return }
        todoItems.append(item)
    }
    
    func checkItem(at index: Int) {
        let checked = todoItem(at: index)
        doneItems.append(checked)
        todoItems.remove(at: index)
    }
    
    func removeAll() {
        todoItems.removeAll()
        doneItems.removeAll()
    }
}
