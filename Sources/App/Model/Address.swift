//
//  Address.swift
//  App
//
//  Created by Christopher Moore on 1/14/20.
//

import Vapor

struct Address: Content {
    let city: String?
    let countryOrRegion: String?
    let postalCode: String?
    let state: String?
    let street: String?
}
