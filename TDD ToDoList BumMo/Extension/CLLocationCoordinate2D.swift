//
//  CLf.swift
//  TDD ToDoList BumMo
//
//  Created by BumMo Koo on 29/04/2019.
//  Copyright © 2019 gbmksquare. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
