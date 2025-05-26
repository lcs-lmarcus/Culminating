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
    @StateObject var viewModel = CitiesListViewModel(cities: sampleCities)
    @State var showingNewFolderView = false
    
    
    // MARK: Computed properties
    var body: some View {
        
        @Bindable var viewModelBindable = viewModel
        
        NavigationStack {
            List($viewModel.cities) { $currentCity in
                NavigationLink {
                    CityDetailView(city: $currentCity)
                } label: {
                    Text(currentCity.name)
                }
            }
            .onDelete(perform: viewModel.deleteCity)
            .navigationTitle("Tour Guide")
            //             Button for adding a new city
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
            }        }
//        func deleteCity(at offsets: IndexSet) {
//            viewModel.deleteCity(at: offsets)
//        }

    }
}

#Preview {
    CitiesListView()
//        .environmentObject(CitiesListViewModel)
}
