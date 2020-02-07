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

    static func mock(timeslot: TimeSlot) -> Self {
        let location = Location(displayName: "Optimist L0202",
                                locationEmailAddress: "",
                                address: Address(city: nil,
                                                 countryOrRegion: nil,
                                                 postalCode: nil,
                                                 state: nil,
                                                 street: nil),
                                coordinates: Coordinates(accuracy: nil,
                                                         altitude: nil,
                                                         altitudeAccuracy: nil,
                                                         latitude: nil,
                                                         longitude: nil))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let startDate = formatter.date(from: timeslot.start.dateTime)!
        let start = formatter.string(from: startDate)
        let end = formatter.string(from: startDate.addingTimeInterval(30 * 60))

        let suggestion = TimeSuggestion(confidence: 100.0,
                                        order: 1,
                                        orgainizerAvailability: "free",
                                        attendeeAvailability: [],
                                        locations: [location],
                                        meetingTimeSlot: TimeSlot(start: Time(dateTime: start,
                                                                              timeZone: "UTC"),
                                                                  end: Time(dateTime: end,
                                                                            timeZone: "UTC")))

        let secondStartDate = startDate.addingTimeInterval(60 * 60 * 2)
        let start2 = formatter.string(from: secondStartDate)
        let end2 = formatter.string(from: secondStartDate.addingTimeInterval(30 * 60))
        let suggestion2 = TimeSuggestion(confidence: 100.0,
                                         order: 2,
                                         orgainizerAvailability: "free",
                                         attendeeAvailability: [],
                                         locations: [location],
                                         meetingTimeSlot: TimeSlot(start: Time(dateTime: start2,
                                                                               timeZone: "UTC"),
                                                                   end: Time(dateTime: end2,
                                                                             timeZone: "UTC")))
        let response = FindMeetingResponse(meetingTimeSuggestions: [suggestion, suggestion2], emptySuggestionReason: nil)
        return response
    }
}
