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
            AsyncImage(url: country.flagURL)
                .frame(width: 40              , height: 40)
                .clipShape(Circle())
                .shadow(radius: 3.0)
            
            VStack(alignment: .leading) {
                Text(country.name)
                Text(country.capital?.joined() ?? "")
            }
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(country: Country(name: "Australia", capital: ["Canberra"], area: 100.8, population: 24000, flagURL: nil))
    }
}
