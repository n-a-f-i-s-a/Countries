//
//  ServiceProtocol.swift
//  Countries
//
//  Created by Nafisa Rahman on 18/3/2023.
//

import Foundation
import Combine

protocol CountryServiceProtocol {
    func getCountries() -> AnyPublisher<[Country], Error>
}
