import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }

    router.get("me") { req -> User in
        return User(id: "f188b595-1577-4580-9fb6-9d36d9d55b69",
                    displayName: "Moore, Christopher",
                    businessPhones: [],
                    givenName: "Christopher",
                    jobTitle: "CW-Professional",
                    mail: "Christopher.Moore2@duke-energy.com",
                    mobilePhone: nil,
                    officeLocation: nil,
                    preferredLanguage: nil,
                    surname: "Moore",
                    userPrincipalName: "Christopher.Moore2@duke-energy.com")
    }

    router.post("me", "findMeetingTimes") { req -> Future<FindMeetingResponse> in
        return req.content.get(FindMeetingRequest.self)
            .map(to: FindMeetingResponse.self) { request in
                dump(request)
                return FindMeetingResponse.mock(timeslot: request.timeConstraint.timeslots.first!)
        }
    }
}
