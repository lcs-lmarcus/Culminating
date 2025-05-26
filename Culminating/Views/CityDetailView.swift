//
//  CityDetailView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-23.
//

import SwiftUI

struct CityDetailView: View {
    
    // MARK: Stored properties
    
    @Binding var city: City
    @State var showingNewAttractionView = false
    
    // MARK: Computed properties
    var body: some View {
        List(city.attractions) { currentAttraction in
            NavigationLink {
                AttractionDetailView(attraction: currentAttraction)
            } label : {
                Text(currentAttraction.name)
            }
        }
        .navigationTitle(city.name)
        //             Button for adding a new guide
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    showingNewAttractionView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingNewAttractionView) {
            NewAttractionView(city: $city, isShowing: $showingNewAttractionView)
//                    .presentationDetents([.fraction(0.4), .medium])
            //                              .environmentObject(viewModel)
        }
    }
}

#Preview {
    NavigationStack {
        CityDetailView(city: .constant(City(
            name: "Toronto",
            latitude: 43.651070,
            longitude: -79.347015,
            attractions: [
                Attraction(
                    id: UUID(),
                    name: "CN Tower",
                    address: "290 Bremner Blvd, Toronto, ON M5V 3L9",
                    latitude: 43.642566,
                    longitude: -79.387057,
                    rating: 5,
                    description: "Iconic 553 m tower offering panoramic city views and a glass-floor observation deck.",
                    isFavourite: false
                ),
                Attraction(
                    id: UUID(),
                    name: "Royal Ontario Museum",
                    address: "100 Queens Park, Toronto, ON M5S 2C6",
                    latitude: 43.667710,
                    longitude: -79.394777,
                    rating: 4,
                    description: "Canada’s largest museum of world cultures and natural history with diverse exhibits.",
                    isFavourite: true
                )
            ]
        )))    }

}
