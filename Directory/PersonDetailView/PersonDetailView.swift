//
//  PersonDetailView.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import SwiftUI

struct PersonDetailView: View {
    var person: Person
    var body: some View {
        List {
            HStack (alignment: .center) {
                Spacer()
                AsyncImage(url: URL(string: person.avatar)!) { avatar in
                    avatar
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(150)
                } placeholder: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(150)
                }
                .frame(width: 300)
                Spacer()
            }
            PersonTextView(title: "Job title: ", description: person.jobtitle)
            PersonTextView(title: "Email: ", description: person.email)
            PersonTextView(title: "Favourite Color: ", description: person.favouriteColor.capitalized)
            PersonTextView(title: "Profile Created on: ", description: person.createdAt.getReadableDate())
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(person.firstName + " " + person.lastName).font(.headline)
                }
            }
        }
        .toolbarBackground(
            Color("Brand"),
            for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        Spacer()
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static let person = Person(createdAt: "", firstName: "", avatar: "", lastName: "", email: "", jobtitle: "", favouriteColor: "", id: "")
    static var previews: some View {
        PersonDetailView(person: person)
    }
}
