//
//  PersonView.swift
//  Directory
//
//  Created by ANSK Vivek on 22/02/24.
//

import SwiftUI

struct PersonView: View {
    
    private let personItemViewModel: PersonViewModel
    
    init(personItemViewModel: PersonViewModel) {
        self.personItemViewModel = personItemViewModel
    }

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: personItemViewModel.person.avatar)!) { avatar in
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
                Text(personItemViewModel.person.fullName)
                    .font(.headline)
                    .padding()
            }
//            .redacted(reason: self.isLoading ? .placeholder : [])
        }
    }
}

#Preview {
    PersonView(personItemViewModel: PersonViewModel(person: Person(createdAt: "", firstName: "", avatar: "", lastName: "", email: "", jobtitle: "", favouriteColor: "", id: "")))
}
