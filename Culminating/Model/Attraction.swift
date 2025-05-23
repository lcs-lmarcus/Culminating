//
//  Attraction.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-23.
//

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
}

