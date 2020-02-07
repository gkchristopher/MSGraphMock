//
//  TimeSuggestion.swift
//  App
//
//  Created by Christopher Moore on 1/14/20.
//

import Vapor

struct TimeSuggestion: Content {
    let confidence: Double
    let order: Int
    let orgainizerAvailability: String
    let attendeeAvailability: [String]
    let locations: [Location]
    let meetingTimeSlot: TimeSlot
}
