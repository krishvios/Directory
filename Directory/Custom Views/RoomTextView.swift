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
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        }
        .alignment(.bottom)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct RoomTextView_Previews: PreviewProvider {
    static var previews: some View {
        RoomTextView(title: "", description: "")
    }
}
