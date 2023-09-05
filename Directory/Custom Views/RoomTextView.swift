//
//  RoomTextView.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import SwiftUI

struct RoomTextView: View {
    var title: String
    var description: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                Text(description)
            }
        }
        .alignment(.bottom)
    }
}

struct RoomTextView_Previews: PreviewProvider {
    static var previews: some View {
        RoomTextView(title: "", description: "")
    }
}
