//
//  TagView.swift
//  Countdown
//
//  Created by Loy Yee Ko on 7/7/2023.
//

import SwiftUI

struct TagView: View {
		var tag: String
		var body: some View {
				Text(tag)
						.padding(.horizontal, 10)
						.padding(.vertical, 5)
						.background(.pink)
						.clipShape(Capsule())
						.foregroundColor(.white)
		}
}
struct TagView_Previews: PreviewProvider {
    static var previews: some View {
				TagView(tag: "hello")
    }
}
