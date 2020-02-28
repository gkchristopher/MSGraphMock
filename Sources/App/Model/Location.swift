//
//  Location.swift
//  App
//
//  Created by Christopher Moore on 1/14/20.
//

import Vapor

struct Location: Content {
    let displayName: String
    let locationEmailAddress: String?
    let address: Address
    let coordinates: Coordinates
}
