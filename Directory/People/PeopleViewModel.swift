//
//  PeopleViewModel.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import Foundation
import Combine

class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []

    let peopleURLString = Constants.endPoint + "/people"
    var cancellables = Set<AnyCancellable>()

    func loadPeopleData() {
        Networking()
            .get(url: peopleURLString)
            .decode(type: [Person].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("error = "+error.localizedDescription)
                }
            }, receiveValue: { response in
                print("response = \(response)")
                self.people = response
            })
            .store(in: &cancellables)
    }
    
}
