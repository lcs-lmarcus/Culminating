//
//  GuideViewModel.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-18.
//

import Foundation

class GuideViewModel: Observable {
    // MARK: Stored properties
    // Defaulting array
    @Published var attraction: [Attraction] = []
    
    // MARK: Computed properties
    
    
    // MARK: Functions
    func add(newAttraction: Attraction) {
        self.attraction.append(newAttraction)
    }
    
}
