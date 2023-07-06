//
//  DataController.swift
//  Countdown
//
//  Created by Loy Yee Ko on 23/6/2023.
//

import Foundation
import CoreData

class DataController : ObservableObject {
	let container = NSPersistentContainer(name: "Coutdown")

	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
				return
			}

			self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
		}
	}
}

