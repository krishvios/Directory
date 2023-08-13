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

struct Person: Decodable, Equatable, Identifiable, Hashable {
    var createdAt: String
    var firstName: String
    var avatar: String
    var lastName: String
    var email: String
    var jobtitle: String
    var favouriteColor: String
    var id: String
}

struct Room: Decodable, Equatable, Identifiable {
    var createdAt: String
    var isOccupied: Bool
    var maxOccupancy: Int
    var id: String
}
