//
//  TourFolder.swift
//  Culminating
//
//  Created by Marcus Li on 2025-04-21.
//

import Foundation

struct TourFolder: Identifiable {
    // MARK: Stored properties
    var id = UUID()
    let name: String
    let image: String
    let guides: [TourGuide]
}

// Create an example of a tour folder
let exampleFolder: [TourFolder] = [TourFolder(
    name: "Toronto",
    image: "Toronto",
    guides: exampleTourGuide
)]
