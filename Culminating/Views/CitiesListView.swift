//
//  CitiesListView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-23.
//

import SwiftUI

struct CitiesListView: View {
    
    // MARK: Stored properties
    
    // Creates an instance of the Cities view model
    // (THE SOURCE OF TRUTH FOR DATA IN THIS APP)
    @State var viewModel = CitiesListViewModel(cities: sampleCities)
    
    
    @State var showingNewFolderView = false
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List(viewModel.cities) { currentCity in
                NavigationLink {
                    CityDetailView(city: currentCity)
                } label: {
                    Text(currentCity.name)
                }
                
            }
            //             Button for adding a new guide / folder
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        showingNewFolderView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingNewFolderView) {
                NewCityView()
                    .environment(viewModel)
//                    .presentationDetents([.fraction(0.4), .medium])
                //                              .environmentObject(viewModel)
            }
            .navigationTitle("Tour Guide")
        }
    }
}

#Preview {
    CitiesListView()
}
