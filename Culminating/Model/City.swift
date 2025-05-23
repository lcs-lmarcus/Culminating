//
//  City.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-23.
//

import Foundation
struct City: Identifiable {
    let id: UUID = UUID()
    let name : String
    let latitude: Double
    let longitude: Double
    let attractions: [Attraction]
//    let image: String
}
