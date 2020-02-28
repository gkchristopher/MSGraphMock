//
//  FindMeetingResponse.swift
//  App
//
//  Created by Christopher Moore on 1/14/20.
//

import Foundation
import Vapor

struct FindMeetingResponse: Content {
    let meetingTimeSuggestions: [TimeSuggestion]
    let emptySuggestionReason: String?
}
