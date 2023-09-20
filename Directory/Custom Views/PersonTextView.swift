//
//  PersonTextView.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import SwiftUI

struct PersonTextView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
            Text(description)
                .font(.headline)
        }
        .padding(.bottom,10)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct PersonTextView_Previews: PreviewProvider {
    static var previews: some View {
        PersonTextView(title: "", description: "")
    }
}
