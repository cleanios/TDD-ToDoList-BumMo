//
//  TodoItem.swift
//  TDD ToDoList BumMo
//
//  Created by BumMo Koo on 29/04/2019.
//  Copyright © 2019 gbmksquare. All rights reserved.
//

import Foundation

struct TodoItem {
    let title: String
    let description: String?
    let timestamp: Double?
    let location: TodoLocation?
    
    init(title: String, description: String? = nil, timestamp: Double? = 0, location: TodoLocation? = nil) {
        self.title = title
        self.description = description
        self.timestamp = timestamp
        self.location = location
    }
}

// MARK: - Equatable
extension TodoItem: Equatable {
    static func ==(lhs: TodoItem, rhs: TodoItem) -> Bool {
        if lhs.location != rhs.location {
            return false
        }
        if lhs.timestamp != rhs.timestamp {
            return false
        }
        if lhs.description != rhs.description {
            return false
        }
        if lhs.title != rhs.title {
            return false
        }
        return true
    }
}
