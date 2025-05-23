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
    
    // Search text
    @State var searchText = ""
    
    // MARK: Computed properties
    
    var body: some View {
        
        TabView(selection: $currentTab) {
            
            CitiesListView()
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(systemName: "house.fill")
                    }
                    
                }
                .tag(1)
            
//            HistoryView()
//                .tabItem {
//                    Label {
//                        Text("History")
//                    } icon: {
//                        Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
//                    }
//                }
//                .tag(2)
            
            FavouriteView()
                .tabItem {
                    Label {
                        Text("Favourite")
                    } icon: {
                        Image(systemName: "star.fill")
                    }
                }
                .tag(3)
        }
        
    }
}

#Preview {
    LandingView()
}
