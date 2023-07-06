//
//  ContentViewModel.swift
//  Countdown
//
//  Created by Loy Yee Ko on 24/6/2023.
//

import Foundation

final class ContentViewModel : ObservableObject {



	static public func getToday() -> String {
		let date = Date()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yyyy"
		return dateFormatter.string(from: date)

	}

}
