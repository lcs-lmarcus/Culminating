//
//  CitiesListViewModel.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-18.
//

import Foundation
import Combine

@Observable
class CitiesListViewModel: ObservableObject {
    
    // MARK: Stored properties
    
    // Defaulting array
    var cities: [City]
    var deletedCities: [City]
    
    init(cities: [City] = [],deletedCities:[City] = []) {
        self.cities = cities
        self.deletedCities = deletedCities
    }
    
//    @Published var attractions: [Attraction] = sampleAttractions
    
    
    // MARK: Computed properties
    
    // MARK: Functions
    func add(newCity: City) {
        self.cities.append(newCity)
    }
    // CHATGPT: https://chatgpt.com/c/683495ad-bcd4-8010-b121-9132aa11e540
    func deleteCity(at offsets: IndexSet) {
        // Append the cities at the offsets to deletedCities
        let removed = offsets.map { cities[$0] }
        deletedCities.append(contentsOf: removed)
        cities.remove(atOffsets: offsets)
        print(deletedCities)
    }
    
    func deleteAttraction(in cityIndex: Int, at offsets: IndexSet) {
        cities[cityIndex].attractions.remove(atOffsets: offsets)
    }

    
}

