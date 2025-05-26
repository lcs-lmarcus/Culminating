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

    // MARK: Computed properties
    var body: some View {
        VStack (alignment: .leading) {
            HStack(alignment: .top, spacing: 16) {
                                // — Left: the photo
                                if let ui = attraction.photo {
                                    Image(uiImage: ui)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                        .cornerRadius(8)
                                } else {
                                    // placeholder
                                    Rectangle()
                                        .fill(Color(.systemGray5))
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(8)
                                        .overlay(
                                            Image(systemName: "photo")
                                                .font(.title)
                                                .foregroundColor(.gray)
                                        )
                                }

                               
                                VStack(alignment: .leading, spacing: 8) {

                                    Text("Address")
                                        .font(.headline)
                                    Text(attraction.address)
                                        .padding(.bottom, 8)
                                }
                            }
                            .padding(.horizontal)
            // Rating and Description
            VStack(alignment: .leading, spacing: 8) {
                Text("Rating")
                    .font(.headline)

                HStack(spacing: 4) {
                    ForEach(0..<attraction.rating) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
    
            VStack(alignment: .leading, spacing: 10) {
                Text("Caption")
                    .font(.headline)
                Text(attraction.description)
            }
            .padding(.horizontal)

            Spacer(minLength: 20)
            Spacer()
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
