//
//  Event+CoreDataProperties.swift
//  Countdown
//
//  Created by Loy Yee Ko on 25/6/2023.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var about: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var start_datetime: Date?
    @NSManaged public var end_datatime: Date?
    @NSManaged public var tags: NSSet?
    @NSManaged public var location: Location?

	public var wrappedId: UUID {
		id ?? UUID()
	}

	public var wrappedStartDatetime: Date {
		start_datetime ?? Date()
	}

	public var wrappedEndDatetime: Date {
		end_datatime ?? Date()
	}

	public var wrappedName: String {
		name ?? "No Name Yet"
	}

	public var wrappedAbout: String {
		about ?? "No About Yet"
	}

	public var tagsArray : [Tag] {
		let set = tags as? Set<Tag> ?? []
		return set.sorted {
			$0.wrappedName > $1.wrappedName
		}
	}

}

// MARK: Generated accessors for tags
extension Event {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension Event : Identifiable {

}
