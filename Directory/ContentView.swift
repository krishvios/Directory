//
//  ContentView.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import SwiftUI

struct ContentView: View {

    enum Tab: Hashable {
        case people
        case rooms
    }

    @State var selectedTab: Tab = .people

    var body: some View {
        TabView(selection: $selectedTab) {
            PeopleView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("People")
                }
                .tag(Tab.people)
            
            RoomsView()
                .tabItem {
                    Image(systemName: "building.2")
                    Text("Rooms")
                }
                .tag(Tab.rooms)
        }
        .onChange(of: selectedTab, { oldValue, newValue in
            print("last tab selected = \(String(describing: oldValue))")
            print("tab selected = \(String(describing: newValue))")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
