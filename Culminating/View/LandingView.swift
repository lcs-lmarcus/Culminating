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
    @EnvironmentObject private var viewModel: GuideViewModel
    
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
            
            HistoryView()
                .tabItem {
                    Label {
                        Text("History")
                    } icon: {
                        Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                    }
                }
                .tag(2)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    showingNewFolderView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingNewFolderView) {
            NewFolderView()
              .environmentObject(viewModel)
        }
    }
}

#Preview {
    LandingView()
}
