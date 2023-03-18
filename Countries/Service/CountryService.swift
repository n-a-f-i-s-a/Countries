//
//  CountryService.swift
//  Countries
//
//  Created by Nafisa Rahman on 18/3/2023.
//

import Combine
import Foundation

final class CountryService {
    enum NetworkError: LocalizedError {
        /// The request URL is bad
        case badURL
        /// The request was bad
        case badRequest
        /// Encountered a server error
        case serverError
        /// Error type is not known
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURL:
                return "Request URL is bad"
            case .badRequest:
                return "Bad request"
            case .serverError:
                return "Encountered server error"
            case .unknown:
                return "Encountered unknow error"
            }
        }
    }
    let baseURL = "https://restcountries.com/v3.1/all"
    
    init() {
        
    }
}

extension CountryService: CountryServiceProtocol {
    
    func getCountries() -> AnyPublisher<[Country], Error> {
        guard let url = URL(string: baseURL) else {
            let error = NetworkError.badURL
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap{ element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [Country].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
