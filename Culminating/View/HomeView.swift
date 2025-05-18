//
//  HomeView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-18.
//

import SwiftUI

struct HomeView: View {
    let folder: [TourFolder]
    
    var body: some View {
        
        NavigationStack {
            List(folder) { currentFolder in
                NavigationLink {
                    GuideListView(guide: currentFolder.guides)
                } label: {
                    FolderView(providedFolder: currentFolder)
                }
            }
        }
    }
}

#Preview {
    HomeView(folder: exampleFolder)
}
