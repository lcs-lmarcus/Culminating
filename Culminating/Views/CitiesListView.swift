//
//  CitiesListView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-23.
//

import SwiftUI

struct CitiesListView: View {
    
    // MARK: Stored properties
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List(sampleCities) { city in
                Text(city.name)
            }
            .navigationTitle("Tour Guide")
        }
    }
}

#Preview {
    CitiesListView()
}
