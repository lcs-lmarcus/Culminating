//
//  GuideViewModel.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-18.
//

import Foundation

@Observable
class GuideViewModel: ObservableObject {
    
    // MARK: Stored properties
//    // List of folders
//    @Published var folders: [String] = []
//    
//    // List of guides
//    @Published var guides: [TourGuide] = exampleTourGuide
    
    // MARK: Functions
    func FavouriteGuide() {
        
    }
    
    class TourGuideViewModel: ObservableObject {
        @Published var guides: [TourGuide] = exampleTourGuide

        // Deletes tour guides at the given offsets
        func deleteGuides(at offsets: IndexSet) {
            guides.remove(atOffsets: offsets)
        }
    }
    
//    func doneButton() {
//    NavigationLink("New Folder", destination:
//        NewFolderView()
//          .environmentObject(viewModel)
//        }
//    )
    

}

final class AddFolderViewModel: ObservableObject {
    // MARK: – Published data
    @Published var folders: [String] = []
    @Published var guides: [TourGuide] = []
    
    // Optional: preload some folders/guides
    init() {
        folders = ["Toronto", "Vancouver", "Hong Kong"]
        guides  = exampleTourGuide
    }
        
        // Add a new guide
        func addGuide(_ guide: TourGuide) {
            guides.append(guide)
        }
        
        /// Delete guides at the given offsets
        func deleteGuides(at offsets: IndexSet) {
            guides.remove(atOffsets: offsets)
        }
        
}

// ChatGPT
// Explicit button handler
//private func delete(item: String) {
//    if let index = items.firstIndex(of: item) {
//        items.remove(at: index)
//    }
//}


