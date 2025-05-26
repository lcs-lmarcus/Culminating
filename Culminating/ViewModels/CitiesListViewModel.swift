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
    
    init(cities: [City] = []) {
        self.cities = cities
    }
    
//    @Published var attractions: [Attraction] = sampleAttractions
    
    
    // MARK: Computed properties
    
    // MARK: Functions
    func add(newCity: City) {
        self.cities.append(newCity)
    }
    // CHATGPT: https://chatgpt.com/c/683495ad-bcd4-8010-b121-9132aa11e540
    func deleteCity(at offsets: IndexSet) {
        cities.remove(atOffsets: offsets)
    }


    
}

