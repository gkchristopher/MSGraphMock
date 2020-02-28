//
//  TimeConstraint.swift
//  App
//
//  Created by Christopher Moore on 1/14/20.
//

import Vapor

struct TimeConstraint: Content {
    let activityDomain: String
    let timeslots: [TimeSlot]
}
