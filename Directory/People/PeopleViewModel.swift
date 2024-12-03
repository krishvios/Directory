//
//  PeopleViewModel.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import Foundation
import SwiftUI
import Combine

class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []
    
    @Published var searchText: String = ""
    var searchResults: [Person] {
        guard !searchText.isEmpty else { return people }
        return people.filter { person in
            person.fullName.lowercased().contains(searchText.lowercased())
        }
    }
    
    let peopleURLString = Constants.endPoint + "/people"
    var cancellables = Set<AnyCancellable>()
    
    func loadPeopleData() {
        Networking.sharedInstance
            .get(url: peopleURLString)
            .decode(type: [Person].self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("error = "+error.localizedDescription)
                }
            }, receiveValue: { response in
                // print("response = \(response)")
                self.people = response
            })
            .store(in: &cancellables)
    }
    
    func loadPeopleData2() {
        Networking.sharedInstance
            .getData(endpoint: peopleURLString, type: [Person].self)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("error = "+error.localizedDescription)
                }
            } receiveValue: { response in
                // print("response = \(response)")
                self.people = response
            }
            .store(in: &cancellables)
    }
}
