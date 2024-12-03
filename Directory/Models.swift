//
//  Models.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import Foundation

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()

let personNameFormatter = PersonNameComponentsFormatter()

struct Person: Codable, Hashable {
    var createdAt: String
    var firstName: String
    var avatar: String
    var lastName: String
    var email: String
    var jobtitle: String
    var favouriteColor: String
    var id: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(createdAt+id)
    }
}

extension Person {
    var fullName: String {
        var components = PersonNameComponents()
        components.givenName = firstName
        components.familyName = lastName
        return personNameFormatter.string(from: components)
    }
}

struct Room: Codable, Hashable {
    var createdAt: String
    var isOccupied: Bool
    var maxOccupancy: Int
    var id: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
