//
//  CountryListViewModel.swift
//  Countries
//
//  Created by Nafisa Rahman on 18/3/2023.
//
import Combine
import Foundation


final class CountryListViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case loaded
        case error
    }
    
    private var anyCancellables = Set<AnyCancellable>()
    private var countryService: CountryServiceProtocol
    
    var countries = [Country]()
    @Published var state: State = .idle

    init(countryService: CountryServiceProtocol) {
        self.countryService = countryService
    }
}

extension CountryListViewModel {
    
    func getAllCountries() {
        state = .loading
        countryService.getCountries()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                switch value {
                case .failure:
                    self?.countries = []
                    self?.state = .error
                case .finished:
                    self?.state = .loaded
                }
            }, receiveValue: { [weak self] country in
                self?.countries = country
                self?.state = .loaded
            })
            .store(in: &anyCancellables)
    }
}
