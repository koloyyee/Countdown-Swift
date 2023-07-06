//
//  AddEventView.swift
//  Countdown
//
//  Created by Loy Yee Ko on 24/6/2023.
//

import SwiftUI
import MapKit



struct AddEventView: View {
	@Environment(\.managedObjectContext) var moc

	@StateObject private var addEventViewModel = AddEventViewModel()

	@Binding var showAddEventView: Bool

	@State private var name = ""
	@State private var about = ""
	@State private var startDatetime = Date()
	@State private var endDatetime = Date()

	@State private var tags = Array<String>()

	let locationFetcher = LocationFetcher()


//	let locations = [
//		LocationMarker(name: "Current", coordinate: MapDetails.lastKnownLocation )
//	]

	var body: some View {
		NavigationStack {

			Form {
				Section {
					TextField("use ',' to create a tag", text: $name)
						.onChange(of: name) {
						if $0.contains(",") {
							tags.append($0.replacingOccurrences(of: ",", with: ""))
							name = ""
							print(tags)
						}
					}
					HStack {
						ForEach(tags, id: \.self) {
								TagView(tag: $0)
						}
					}
				} header: {
					Text("Name")
				}

				Section {
					DatePicker("Start", selection: $startDatetime)
					//  PartialRangeThrough
					DatePicker("End", selection: $endDatetime, in: startDatetime..., displayedComponents: [.date, .hourAndMinute])

				} header: {
					Text("Date")
				}

				Section {
					TextEditor(text: $about)
						.frame(minHeight: 200)

				} header: {
					Text("Description")
				}
				// to be added feature
//				Divider()
//
//
//				Button("Read Location") {
//
//					if let location = self.locationFetcher.lastKnownLocation {
//						print(location)
//					} else {
//						self.locationFetcher.start()
//						print("oopsy")
//					}
//				}
//
//				Section {
//					Map(coordinateRegion: $addEventViewModel.mapRegion,showsUserLocation: true)
//						.frame(width: 300, height: 200)
//						.accentColor(Color(.systemPink))
//						.onAppear(perform: addEventViewModel.checkIfLocationManagerIsEnabled)
//
//				} header: {
//					Text("Location")
//				}

			}
				.background(Color.white)
				.scrollContentBackground(.hidden)
				.navigationTitle("Add Event")

		}

		HStack {

			Button (role: .cancel) {
				showAddEventView = false
			} label: {
				Label("Back", systemImage: "arrowshape.backward")

			}
				.padding()

			Spacer()

			Button {
				print(name)
			} label: {
				Label("New Event", systemImage: "plus")
					.foregroundColor(disableForm ? .gray : .pink)

			}
				.disabled(disableForm)
				.padding()

		}
			.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {

			}
		}
	}
	var disableForm: Bool {
		name.count == 0
	}
}


