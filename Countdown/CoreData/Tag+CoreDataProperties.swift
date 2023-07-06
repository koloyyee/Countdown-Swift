//
//  Tag+CoreDataProperties.swift
//  Countdown
//
//  Created by Loy Yee Ko on 23/6/2023.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var events: NSSet?

	public var wrappedName : String {
		name ?? "Unknown Name"
	}
	public var wrappedId : UUID {
		id ?? UUID()
	}

	public var eventArray: [Event] {
		let set = events as? Set<Event> ?? []

		return set.sorted {
			$0.wrappedName > $1.wrappedName
		}
	}
}

// MARK: Generated accessors for events
extension Tag {

    @objc(addEventsObject:)
    @NSManaged public func addToEvents(_ value: Event)

    @objc(removeEventsObject:)
    @NSManaged public func removeFromEvents(_ value: Event)

    @objc(addEvents:)
    @NSManaged public func addToEvents(_ values: NSSet)

    @objc(removeEvents:)
    @NSManaged public func removeFromEvents(_ values: NSSet)

}

extension Tag : Identifiable {

}
