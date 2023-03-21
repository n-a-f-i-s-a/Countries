//
//  Country.swift
//  Countries
//
//  Created by Nafisa Rahman on 18/3/2023.
//

import Foundation

struct Country: Decodable, Hashable {
    let name: String
    let capital: [String]?
    let area: Double
    let population: Int
    let flagURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case area
        case population
        case flags
    }
    
    enum NameCodingKeys: String, CodingKey {
        case official
    }
    
    enum FlagsCodingKeys: String, CodingKey {
        case png
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nameContainer = try container.nestedContainer(keyedBy: NameCodingKeys.self, forKey: .name)
        name = try nameContainer.decode(String.self, forKey: .official)
        
        capital = try container.decodeIfPresent([String].self, forKey: .capital)
        area = try container.decode(Double.self, forKey: .area)
        population = try container.decode(Int.self, forKey: .population)
        
        let flagsContainer = try container.nestedContainer(keyedBy: FlagsCodingKeys.self, forKey: .flags)
        if let flagURLString = try flagsContainer.decodeIfPresent(String.self, forKey: .png) {
            flagURL = try? URL(string: flagURLString)
        } else {
            flagURL = nil
        }
       
    }
    
    init(
        name: String,
        capital: [String],
        area: Double,
        population: Int,
        flagURL: URL?
    ) {
        self.name = name
        self.capital = capital
        self.area = area
        self.population = population
        self.flagURL = flagURL
    }
    
}

extension Country: Identifiable {
    var id: UUID {
        UUID()
    }
}
