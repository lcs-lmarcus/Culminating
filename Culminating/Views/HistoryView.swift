//
//  HistoryView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-20.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var viewModel: CitiesListViewModel
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.deletedCities) { $currentcity in
                    NavigationLink {
                        CityDetailView(city: $currentcity)
                    } label: {
                        Text(currentcity.name)
                    }
                }
                .onDelete { offsets in
                    viewModel.deletedCities.remove(atOffsets: offsets)
                }
                .navigationTitle("Tour Guide")
            }
        }
    }
}


#Preview {
    HistoryView()
}
