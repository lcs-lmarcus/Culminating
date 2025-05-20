//
//  GuideViewModel.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-18.
//

import Foundation

@Observable
class GuideViewModel{
    
    // MARK: Stored properties
    
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
