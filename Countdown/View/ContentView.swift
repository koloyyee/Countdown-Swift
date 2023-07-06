//
//  ContentView.swift
//  Countdown
//
//  Created by Loy Yee Ko on 23/6/2023.
//
/// 

import SwiftUI
import Foundation

struct ContentView: View {
	@StateObject private var contentViewModel = ContentViewModel()
	let today = ContentViewModel.getToday()

	@State private var showAddEventView = false

    var body: some View {
			NavigationView {
				List{}

					.navigationTitle(Text(today))

					.toolbar {
						ToolbarItem {

							Button {
								showAddEventView = true
								print("showAddEventView", showAddEventView)
							} label: {
								Label("Add Event", systemImage: "plus.circle.fill" )
									.font(.largeTitle)
									.foregroundColor(.pink)
							}
							.fullScreenCover(isPresented: $showAddEventView) { AddEventView (showAddEventView: $showAddEventView)}
//							.sheet(isPresented: $showAddEventView) {}
						}
					}
//					.background(Color.gray)
//					.opacity(0.8)
//					.ignoresSafeArea()

			}
		}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
			ContentView()
    }
}
