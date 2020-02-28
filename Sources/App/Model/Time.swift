//
//  Time.swift
//  App
//
//  Created by Christopher Moore on 1/14/20.
//

import Vapor

struct Time: Content {
    let dateTime: Date
    let timeZone: String
}
