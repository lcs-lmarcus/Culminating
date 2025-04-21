//
//  TourGuide.swift
//  Culminating
//
//  Created by Marcus Li on 2025-04-20.
//

import Foundation

struct TourGuide {
    
    // MARK: Stored properties
    let name: String
    let date: String
    let address: String
    let folder: String
    let image: String
    let rating: Double
    let caption: String
    
}

// Create an example of a tour guide
let exampleTourGuide = TourGuide(
    name: "CN Tower",
    date: "April 14, 2025",
    address: "290 Bremner Blvd, Toronto, ON M5V 3L9",
    folder: "Toronto",
    image: "CN Tower",
    rating: 5.0,
    caption: "The CN Tower is a 553.3 m-high communications and observation tower in Toronto, Ontario, Canada."
)
