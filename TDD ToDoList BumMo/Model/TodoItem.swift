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
