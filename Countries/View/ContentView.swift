//
//  ContentView.swift
//  Countries
//
//  Created by Nafisa Rahman on 18/3/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var countryListViewModel: CountryListViewModel
    
    var body: some View {
        NavigationStack {
            switch(countryListViewModel.state) {
            case .loading:
                LoadingView()
            case .loaded:
                List(countryListViewModel.countries) { country in
                    NavigationLink(value: country, label: {
                        CountryRow(country: country)
                    })
                }
                .navigationTitle("Countries")
            case .idle:
                EmptyView()
            case .error:
                ErrorView()
            }
        }
       
        .padding()
        .onAppear {
            countryListViewModel.getAllCountries()
        }
       
    }
}


extension ContentView {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            countryListViewModel: CountryListViewModel(
                countryService: CountryService()
            )
        )
    }
}
