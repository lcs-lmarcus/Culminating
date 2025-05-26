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
    @StateObject private var viewModel = CitiesListViewModel(cities: sampleCities)
    //    @StateObject var viewModel = CitiesListViewModel(cities: sampleCities)
    @State var showingNewFolderView = false
    
    
    // MARK: Computed properties
    var body: some View {
        
        @Bindable var viewModelBindable = viewModel
        
        NavigationStack {
            List {
                ForEach($viewModel.cities) { $currentcity in
                    NavigationLink {
                        CityDetailView(city: $currentcity)
                            .environmentObject(viewModel)
                    } label: {
                        Text(currentcity.name)
                    }
                }
                //            List($viewModel.cities) { $currentCity in
                //                NavigationLink {
                //                    CityDetailView(city: $currentCity)
                //                } label: {
                //                    Text(currentCity.name)
                //                }
                //            }
                .onDelete { offsets in
                    viewModel.deleteCity(at: offsets)
                }
                .navigationTitle("Tour Guide")
                }
            // toolbar - button for adding a new city
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
            }
        }
    }
}

#Preview {
    CitiesListView()
}
