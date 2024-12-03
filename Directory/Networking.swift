//
//  Networking.swift
//  Directory
//
//  Created by ANSK Vivek on 13/08/23.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case responseError
    case noData
    case decode
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .responseError: return "Error while getting the response."
        case .noData: return "Unable to get the data."
        case .decode: return "Error while decoding the data."
        case .unknown: return "Unknown error"
        }
    }
}

final class Networking: Any {
    
    private let session = URLSession.shared
    
    static public let sharedInstance = Networking()
    
    static func getInstance() -> Networking {
        return sharedInstance
    }
    
    private var cancellables = Set<AnyCancellable>()

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
    
    func getData<T: Decodable>(endpoint: String, id: Int? = nil, type: T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in  // (4) -> Future Publisher
            guard let self = self, let url = URL(string: endpoint) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            print("URL is \(url.absoluteString)")
            URLSession.shared.dataTaskPublisher(for: url) // (5) -> Publisher
                .tryMap { (data, response) -> Data in  // (6) -> Operator
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())  // (7) -> Operator
                .receive(on: RunLoop.main) // (8) -> Sheduler Operator
                .sink(receiveCompletion: { (completion) in  // (9) -> Subscriber
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: {  data in  // (10)
                    print(data)
                    promise(.success(data)
                    ) })
                .store(in: &self.cancellables)  // (11)
        }
    }
}
