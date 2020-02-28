import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }

    router.get("me") { req -> User in
        Mock.me
    }

    router.post("me", "findMeetingTimes") { req -> Future<FindMeetingResponse> in
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(Mock.formatter)

        return try req.content.decode(json: FindMeetingRequest.self, using: decoder).map { request in
            guard let timeslot = request.timeConstraint.timeslots.first else {
                fatalError()
            }
            return Mock.meetingResponse(for: timeslot)
        }
    }
}
