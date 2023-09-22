//
//  Networking.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import Foundation
import Combine

enum NetworkError: Error {
    case noData
    case decode
    
    var errorDescription: String? {
        switch self {
        case .noData: return "Unable to get the data."
        case .decode: return "Error while decoding the data."
        }
    }
}

final class Networking: Any {
    
    private let session = URLSession.shared
    
    static public let sharedInstance = Networking()
    
    static func getInstance() -> Networking {
        return sharedInstance
    }

    func get<Object: Codable>(url: String, resultType: Object.Type = Object.self) -> some Publisher<Object, Error> {
        session
            .dataTaskPublisher(for: URL(string: url)!)
            .map(\.data)
            .decode(type: Object.self, decoder: jsonDecoder)
    }
    
    func get(url: String) -> some Publisher<Data, Error> {
        session
            .dataTaskPublisher(for: URL(string: url)!)
            .map(\.data)
            .mapError{ $0 as Error }
    }
}
