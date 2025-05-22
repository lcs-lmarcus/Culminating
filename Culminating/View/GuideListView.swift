//
//  GuideListView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-17.


import SwiftUI

struct GuideListView: View {
    
    let guide: [TourGuide]
    
    var body: some View {
        
        NavigationStack {
            List(guide) { currentGuide in
                NavigationLink {
                    GuideDetailView(guideToShow: currentGuide)
                } label: {
                    GuideView(providedGuide: currentGuide)
                }
            }
            .environment(GuideViewModel())
            .navigationTitle("Toronto")
        }
    }
}

#Preview {
    GuideListView(guide: exampleTourGuide)
}
