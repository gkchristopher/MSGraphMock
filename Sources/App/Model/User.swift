//
//  User.swift
//  App
//
//  Created by Christopher Moore on 1/13/20.
//

import Foundation
import Vapor

struct User: Content {
    let id: String
    let displayName: String
    let businessPhones: [String]
    let givenName: String
    let jobTitle: String
    let mail: String
    let mobilePhone: String?
    let officeLocation: String?
    let preferredLanguage: String?
    let surname: String
    let userPrincipalName: String
}
