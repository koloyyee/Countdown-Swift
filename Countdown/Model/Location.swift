//
//  Location.swift
//  Countdown
//
//  Created by Loy Yee Ko on 1/7/2023.
//

import Foundation
import CoreLocation

struct LocationMarker: Identifiable {
	let id = UUID()
	let name: String
	let coordinate : CLLocationCoordinate2D
}
