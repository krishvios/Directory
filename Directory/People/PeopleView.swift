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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(peopleViewModel.searchResults, id: \.self) { person in
                    NavigationLink(value: person) {
                        HStack {
                            AsyncImage(url: URL(string: person.avatar)!) { avatar in
                                avatar
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            } placeholder: {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            }
                            .frame(width: 60)
                            
                            VStack(alignment: .leading) {
                                Text(person.firstName + " " + person.lastName)
                                    .font(.headline)
                                    .padding()
                            }
                            .redacted(reason: self.isLoading ? .placeholder : [])
                        }
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
                peopleViewModel.loadPeopleData()
                DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                    self.isLoading = false
                })
            }
        }
        .searchable(text: $peopleViewModel.searchText, prompt: "search")
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
