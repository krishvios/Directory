//
//  RoomsView.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import SwiftUI

struct RoomsView: View {
    @StateObject var roomsViewModel = RoomsViewModel()
    
    var body: some View {
        NavigationStack {
            List(roomsViewModel.rooms) { room in
                HStack {
                    VStack {
                        RoomTextView(title: "Room number: ", description: room.id)
                        RoomTextView(title: "Max Occupancy: ", description: "\(room.maxOccupancy)")
                        RoomTextView(title: "Is Occupied: ", description: (room.isOccupied ? "Yes" : "No"))
                        RoomTextView(title: "Booked on: ", description: room.createdAt.getReadableDate())
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                }
            }
            .listStyle(.plain)
            .navigationTitle("rooms")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("Brand"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .onAppear {
                roomsViewModel.loadRoomsData()
            }
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
    }
}
