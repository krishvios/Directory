//
//  PeopleView.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import SwiftUI

struct PeopleView: View {
    @StateObject var peopleviewModel = PeopleViewModel()

    var body: some View {
        NavigationStack {
            List(peopleviewModel.people) { person in
                HStack {
                    AsyncImage(url: URL(string: person.avatar)!) { avatar in
                        
//                        if let image = avatar {
//                                            image
//                                                .resizable()
//                                                .scaledToFit()
//                                        }
//                                        else if avatar.error != nil {
//                                            Text("There was an eror loading image.")
//                                        }
//                                        else {
//                                            ProgressView()
//                                        }
                        
                        
                        
                        avatar
                            .resizable()
                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 40)
                            .cornerRadius(30)
                    } placeholder: {
//                        ProgressView()
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 40)
                            .cornerRadius(30)
                    }
                    .frame(width: 60)
                    
                    VStack(alignment: .leading) {
                        Text(person.firstName + " " + person.lastName)
                            .font(.headline)
                            .padding()
//                        Text(movie.overview)
//                            .font(.caption)
//                            .lineLimit(3)
                    }
                }
//                .navigationDestination(for: String.self, destination: MovieDetailsView.init)
            }
            .navigationTitle("People")
//            .searchable(text: $viewModel.searchQuery)
            .onAppear {
                peopleviewModel.loadPeopleData()
            }

            
            
//            List {
//                ForEach
//            }
        }
//        .onAppear {
//            PeopleViewModel().loadPeopleData()
//        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
