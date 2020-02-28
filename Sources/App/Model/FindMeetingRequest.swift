//
//  FindMeetingRequest.swift
//  App
//
//  Created by Christopher Moore on 1/14/20.
//

import Foundation
import Vapor

struct FindMeetingRequest: Content {
    let locationConstraint: LocationConstraint
    let timeConstraint: TimeConstraint
}
