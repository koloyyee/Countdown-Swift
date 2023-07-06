//
//  AddEventViewModel.swift
//  Countdown
//
//  Created by Loy Yee Ko on 24/6/2023.
//

import MapKit
import CoreData


enum MapDetails {
	static let startingLocation = CLLocationCoordinate2D(latitude: 22.317893, longitude: 114.200334)
	static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
	static var lastKnownLocation = startingLocation
}

final class AddEventViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
	
	private let viewContext = PersistenceController.shared.container.viewContext

	let locationManager = CLLocationManager()
	var lastKnownLocation: CLLocationCoordinate2D = MapDetails.startingLocation
	let locationFetcher = LocationFetcher()

	@Published var mapRegion = MKCoordinateRegion(
		center: MapDetails.lastKnownLocation,
		span: MapDetails.defaultSpan)

	func checkIfLocationManagerIsEnabled() {

		if CLLocationManager.locationServicesEnabled() {
//			locationManager?.desiredAccuracy = kCLLocationAccuracyBest
			locationManager.delegate = self

		} else {
			print("turn it back on!")
			self.locationFetcher.start()

		}
	}

	private func checkLocationAuthorization() {
		switch locationManager.authorizationStatus {

		case .notDetermined:
			locationManager.requestWhenInUseAuthorization()
		case .restricted:
			print("You location is restricted.")
		case .denied:
			print("Denied")
		case .authorizedAlways, .authorizedWhenInUse:
			mapRegion = MKCoordinateRegion(
				center: locationManager.location!.coordinate,
				span: MapDetails.defaultSpan
			)
		@unknown default:
			break
		}
	}

	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		checkLocationAuthorization()
	}

	func checkInputIsEmpty(field: String) -> Bool {
		return field.count > 0
	}

	func start() {
		locationManager.requestWhenInUseAuthorization()
		locationManager.startUpdatingLocation()

	}

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		MapDetails.lastKnownLocation = locations.first?.coordinate ?? MapDetails.startingLocation
	}


	func saveEvent(name: String, about: String, startDatetime : Date, endDatetime: Date, tags: [Tag]) {
		let newEvent = Event(context: viewContext)
		newEvent.id = UUID()
		newEvent.name = name
		newEvent.start_datetime = startDatetime
		newEvent.end_datatime = endDatetime

		for tag in tags {
			let newTag = Tag(context: viewContext)
			newTag.id = UUID()
			newTag.name = tag.name
			newEvent.addToTags(newTag)
		}
		
		do {
			try viewContext.save()
		} catch {
			print("Error: \(error.localizedDescription)")
		}

	}
}
