//
//  LocationConstraint.swift
//  App
//
//  Created by Christopher Moore on 1/15/20.
//

import Vapor

struct LocationConstraint: Content {
    let isRequired: Bool
    let suggestLocation: Bool
}
