//
//  TimeSlot.swift
//  App
//
//  Created by Christopher Moore on 1/14/20.
//

import Vapor

struct TimeSlot: Content {
    let start: Time
    let end: Time
}
