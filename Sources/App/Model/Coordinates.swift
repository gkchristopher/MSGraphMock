//
//  Coordinates.swift
//  App
//
//  Created by Christopher Moore on 1/14/20.
//

import CoreLocation
import Vapor

struct Coordinates: Content {
    let accuracy: Double?
    let altitude: Double?
    let altitudeAccuracy: Double?
    let latitude: Double?
    let longitude: Double?

    var locationCoordinate2D: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0)
    }
}
