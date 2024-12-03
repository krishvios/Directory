//
//  PeopleView.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import SwiftUI

struct PeopleView: View {
    @StateObject var peopleViewModel = PeopleViewModel()
    @State var isLoading = true
    
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationStack {
            List {
                ForEach(peopleViewModel.searchResults, id: \.self) { person in
                    NavigationLink(value: person) {
                        PersonView(personItemViewModel: PersonViewModel(person: person))
                            .redacted(reason: self.isLoading ? .placeholder : [])
                    }
                }
                .listRowSeparator(.hidden, edges: .all)
                .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
            .navigationDestination(for: Person.self, destination: { person in
                PersonDetailView(person: person)
            })
            .listStyle(.plain)
            .navigationTitle("people")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(
                Color("Brand"),
                            for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .onAppear {
                peopleViewModel.loadPeopleData2()
                DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                    self.isLoading = false
                })
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $peopleViewModel.searchText, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "search")
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
