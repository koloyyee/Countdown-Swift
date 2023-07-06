//
//  PersistenceController.swift
//  Countdown
//
//  Created by Loy Yee Ko on 23/6/2023.
//

import Foundation
import CoreData

struct PersistenceController {

	static let shared = PersistenceController()
	let container : NSPersistentContainer

	static var preview: PersistenceController = {
		let controller = PersistenceController(inMemory: true)

		for _ in 0..<10 {
			let event = Event(context: controller.container.viewContext)
			event.name = "Example event name 1"
		}
		return controller
	}()

	init(inMemory : Bool = false) {
		container = NSPersistentContainer(name: "Countdown")

		if inMemory {
			container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
		}

		container.loadPersistentStores { description, error in
			if let error = error {
				fatalError("Error: \(error.localizedDescription)")
			}
		}

		self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
	}

	func save() {
		let context = container.viewContext

		if context.hasChanges {
			do {
				try context.save()
			} catch {
				print("Error: \(error.localizedDescription)")
			}
		}

	}
}
