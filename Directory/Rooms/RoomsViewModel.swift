//
//  RoomsViewModel.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import Foundation
import Combine

class RoomsViewModel: ObservableObject {
    @Published var rooms: [Room] = []

    let roomsURLString = Constants.endPoint + "/rooms"
    var cancellables = Set<AnyCancellable>()

    func loadRoomsData() {
        Networking.sharedInstance
            .get(url: roomsURLString)
            .decode(type: [Room].self, decoder: jsonDecoder)
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
                self.rooms = response
            })
            .store(in: &cancellables)
    }
    
    func loadRoomsData2() {
        Networking.sharedInstance
            .getData(endpoint: roomsURLString, type: [Room].self)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("error = "+error.localizedDescription)
                }
            } receiveValue: { response in
                // print("response = \(response)")
                self.rooms = response
            }
            .store(in: &cancellables)
    }
}
