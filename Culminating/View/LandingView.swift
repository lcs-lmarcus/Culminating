//
//  LandingView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-18.
//

import SwiftUI

struct LandingView: View {
    // MARK: Stored properties
    @State var currentTab = 0
    @State var showingNewFolderView = false
    
    // MARK: Computed properties
    
    var body: some View {
        TabView(selection: $currentTab) {
            
            HomeView(folder: exampleFolder)
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(systemName: "house.fill")
                    }
                    
                }
                .tag(1)
            NewFolderView()
                .tabItem {
                    Label {
                        Text ("New Folder")
                    } icon: {
                        Image(systemName: "folder.fill.badge.plus")
                    }
                }
                .toolbar {
                    ToolbarItem (placement: .navigationBarLeading) {
                        
                            Button {
                                showingNewFolderView = true
                            
                        } label: {
                            Image(systemName: "plus")
                        }
                        .navigationDestination(isPresented: $showingNewFolderView) {
                                        NewFolderView()
                                    }
                    }
                }
        }
    }
}

#Preview {
    LandingView()
}
