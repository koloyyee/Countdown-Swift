//
//  CountdownApp.swift
//  Countdown
//
//  Created by Loy Yee Ko on 23/6/2023.
//

import SwiftUI

@main
struct CountdownApp: App {
	@Environment(\.scenePhase) var scenePhase
	let persistenceController = PersistenceController.shared

	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(\.managedObjectContext, persistenceController.container.viewContext)
		}
			.onChange(of: scenePhase) { _ in
			persistenceController.save()
		}
	}
}
