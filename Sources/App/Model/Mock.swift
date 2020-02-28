//
//  Mock.swift
//  App
//
//  Created by Christopher Moore on 2/13/20.
//

import Foundation

struct Mock {
    static let locationNames = ["Cool Conference Room L0202", "Cool conference room"]

    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()

    static var me: User {
        User(id: "42",
        displayName: "Moore, Christopher",
        businessPhones: [],
        givenName: "Christopher",
        jobTitle: "Professional",
        mail: "Christopher.Moore@example.com",
        mobilePhone: nil,
        officeLocation: nil,
        preferredLanguage: nil,
        surname: "Moore",
        userPrincipalName: "Christopher.Moore@example.com")
    }

    static func meetingResponse(for timeslot: TimeSlot) -> FindMeetingResponse {
        let location = Location(displayName: locationNames.random ?? "Unknown",
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

        var comps = Calendar.current.dateComponents([.hour, .day, .month, .year], from: timeslot.start.dateTime)
        comps.hour! += 1
        let startDate = Calendar.current.date(from: comps)!
        let endDate = startDate.addingTimeInterval(30 * 60)

        let suggestion1 = TimeSuggestion(confidence: 100.0,
                                        order: 1,
                                        orgainizerAvailability: "free",
                                        attendeeAvailability: [],
                                        locations: [location],
                                        meetingTimeSlot: TimeSlot(start: Time(dateTime: startDate,
                                                                              timeZone: "UTC"),
                                                                  end: Time(dateTime: endDate,
                                                                            timeZone: "UTC")))

        let secondStartDate = startDate.addingTimeInterval(60 * 60)
        let secondEndDate = secondStartDate.addingTimeInterval(30 * 60)
        let suggestion2 = TimeSuggestion(confidence: 100.0,
                                         order: 2,
                                         orgainizerAvailability: "free",
                                         attendeeAvailability: [],
                                         locations: [location],
                                         meetingTimeSlot: TimeSlot(start: Time(dateTime: secondStartDate,
                                                                               timeZone: "UTC"),
                                                                   end: Time(dateTime: secondEndDate,
                                                                             timeZone: "UTC")))
        let response = FindMeetingResponse(meetingTimeSuggestions: [suggestion1, suggestion2], emptySuggestionReason: nil)
        return response
    }
}
