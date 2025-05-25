//
//  CitiesListView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-23.
//

import SwiftUI

struct CitiesListView: View {
    
    // MARK: Stored properties
    @State var showingNewFolderView = false
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List(sampleCities) { currentCity in
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
                            NewButtonView()
                                .presentationDetents([.fraction(0.2), .medium])
//                              .environmentObject(viewModel)
                        }
            .navigationTitle("Tour Guide")
        }
    }
}

#Preview {
    CitiesListView()
}
