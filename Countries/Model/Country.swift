//
//  Country.swift
//  Countries
//
//  Created by Nafisa Rahman on 18/3/2023.
//

import Foundation

struct Country: Codable, Hashable {
    let name: String
    let capital: [String]?
    let area: Double
    let population: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case area
        case population
    }
    
    enum NameCodingKeys: String, CodingKey {
        case official
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nameContainer = try container.nestedContainer(keyedBy: NameCodingKeys.self, forKey: .name)
        name = try nameContainer.decode(String.self, forKey: .official)
        
        capital = try container.decodeIfPresent([String].self, forKey: .capital)
        area = try container.decode(Double.self, forKey: .area)
        population = try container.decode(Int.self, forKey: .population)
    }
    
    init(
        name: String,
        capital: [String],
        area: Double,
        population: Int
    ) {
        self.name = name
        self.capital = capital
        self.area = area
        self.population = population
    }
    
}

extension Country: Identifiable {
    var id: UUID {
        UUID()
    }
}
