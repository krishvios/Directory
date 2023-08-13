//
//  Person.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import Foundation

struct Person: Codable, Identifiable, Hashable {
    let id: UUID
    var createdAt: String
    var firstName: String
    var avatar: String
    var lastName: String
    var email: String
    var jobtitle: String
    var favouriteColor: String
//    var id: String
}
