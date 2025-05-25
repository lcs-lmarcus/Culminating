//
//  AttractionDetailView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-23.
//

import SwiftUI

struct AttractionDetailView: View {
    // MARK: Stored properties
    let attraction: Attraction
//    @EnvironmentObject private var viewModel: CitiesListViewModel
//    @Environment(\.dismiss)   private var dismiss
    // MARK: Computed properties
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(attraction.address)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom)
                
                Spacer()
            }
            // From ChatGpt
            HStack {
                ForEach(0..<attraction.rating) { _ in
                    Image(systemName: "star.fill")
                }
            }
            Spacer()
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button(role: .destructive) {
//                            viewModel.delete(attraction)
//                            dismiss()
//                        } label: {
//                            Image(systemName: "trash")
//                        }
//                    }
//                }
        }
        .padding()
        .navigationTitle(attraction.name)
    }
}

#Preview {
    NavigationStack {
        AttractionDetailView(attraction:  Attraction(
            id: UUID(),
            name: "CN Tower",
            address: "290 Bremner Blvd, Toronto, ON M5V 3L9",
            latitude: 43.642566,
            longitude: -79.387057,
            rating: 5,
            description: "Iconic 553 m tower offering panoramic city views and a glass-floor observation deck.",
            isFavourite: false
        ))
    }
}
