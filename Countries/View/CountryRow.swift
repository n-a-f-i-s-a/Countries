//
//  CountryRow.swift
//  Countries
//
//  Created by Nafisa Rahman on 18/3/2023.
//

import SwiftUI

struct CountryRow: View {
    var country: Country
    
    var body: some View {
        HStack {
            Text(country.name)
            
            VStack {
                Text(country.capital?.joined() ?? "")
                Text("\(country.population)")
            }
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(country: Country(name: "Australia", capital: ["Canberra"], area: 100.8, population: 24000))
    }
}
