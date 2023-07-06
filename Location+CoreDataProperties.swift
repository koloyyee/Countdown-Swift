//
//  Location+CoreDataProperties.swift
//  Countdown
//
//  Created by Loy Yee Ko on 25/6/2023.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var long: Double
    @NSManaged public var lat: Double
    @NSManaged public var events: NSSet?


	public var wrappedId: UUID {
		id ?? UUID()
	}

	public var wrappedName: String {
		name ?? "No Name Yet"
	}

	public var eventsArray : [Event] {
		let set = events as? Set<Event> ?? []
		return set.sorted {
			$0.wrappedName > $1.wrappedName
		}
	}

}

// MARK: Generated accessors for events
extension Location {

    @objc(addEventsObject:)
    @NSManaged public func addToEvents(_ value: Event)

    @objc(removeEventsObject:)
    @NSManaged public func removeFromEvents(_ value: Event)

    @objc(addEvents:)
    @NSManaged public func addToEvents(_ values: NSSet)

    @objc(removeEvents:)
    @NSManaged public func removeFromEvents(_ values: NSSet)

}

extension Location : Identifiable {

}
