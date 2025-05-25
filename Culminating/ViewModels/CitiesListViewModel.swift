//
//  CitiesListViewModel.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-18.
//

import Foundation

@Observable
class CitiesListViewModel: Observable {
    
    // MARK: Stored properties
    
    // Defaulting array
    var cities: [City]
    
    init(cities: [City] = []) {
        self.cities = cities
    }
    
    // MARK: Computed properties
    
    // MARK: Functions
    func add(newCity: City) {
        self.cities.append(newCity)
    }
//    func delete(deleteAttraction: Attraction) {
//        Attraction.removeAll { $0.id == Attraction.id }
//      }
    
}
