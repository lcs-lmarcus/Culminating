//
//  Attraction.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-23.
//

import UIKit
import Foundation

struct Attraction: Identifiable {
    let id: UUID
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
    let rating: Int
    let description: String
    let isFavourite: Bool
    var photo: UIImage? = nil
}
// Created sample data from ChatGPT
let sampleAttractions: [Attraction] = [
    // Toronto
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
    ),

    // Vancouver
    Attraction(
        id: UUID(),
        name: "Stanley Park",
        address: "Entrance at Coal Harbour, Vancouver, BC V6G 1Z4",
        latitude: 49.304300,
        longitude: -123.144300,
        rating: 5,
        description: "Expansive urban park featuring forest trails, totem poles, beaches, and scenic seawall.",
        isFavourite: false
    ),
    Attraction(
        id: UUID(),
        name: "Granville Island",
        address: "1689 Johnston St, Vancouver, BC V6H 3R9",
        latitude: 49.271500,
        longitude: -123.134000,
        rating: 4,
        description: "Vibrant market district with artisan shops, galleries, eateries, and waterfront views.",
        isFavourite: false
    ),

    // Montréal
    Attraction(
        id: UUID(),
        name: "Old Port of Montréal",
        address: "333 Rue de la Commune O, Montréal, QC H2Y 2E2",
        latitude: 45.506607,
        longitude: -73.554005,
        rating: 4,
        description: "Historic riverfront area offering bike paths, river cruises, and seasonal festivals.",
        isFavourite: false
    ),
    Attraction(
        id: UUID(),
        name: "Mount Royal Park",
        address: "1260 Remembrance Rd, Montréal, QC H3H 1A2",
        latitude: 45.504778,
        longitude: -73.587807,
        rating: 5,
        description: "Lush hilltop park designed by Frederick Law Olmsted with lookout points and trails.",
        isFavourite: true
    )
]

