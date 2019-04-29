//
//  TodoLocation.swift
//  TDD ToDoList BumMo
//
//  Created by BumMo Koo on 29/04/2019.
//  Copyright © 2019 gbmksquare. All rights reserved.
//

import Foundation
import CoreLocation

struct TodoLocation {
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension TodoLocation: Equatable {
    static func == (lhs: TodoLocation, rhs: TodoLocation) -> Bool {
        return lhs.name == rhs.name  && lhs.coordinate == rhs.coordinate
    }
}
