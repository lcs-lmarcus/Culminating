//
//  HomeView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-18.
//

//import SwiftUI
//
//struct HomeView: View {
//    
//    @State var showingNewFolderView = false
//    @EnvironmentObject private var viewModel: GuideViewModel
//    
//    let folder: [TourFolder]
//    
//    var body: some View {
//        
//        NavigationStack {
//            List(folder) { currentFolder in
//                NavigationLink {
//                    GuideListView(guide: currentFolder.guides)
//                } label: {
//                    FolderView(providedFolder: currentFolder)
//                }
//            }
//            .navigationTitle("Cities")
//            // Button for adding a new guide / folder
//            .toolbar {
//                ToolbarItem(placement: .automatic) {
//                    Button {
//                        showingNewFolderView = true
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//                }
//            }
//            .sheet(isPresented: $showingNewFolderView) {
//                PlusButtonView()
//                    .presentationDetents([.fraction(0.2), .medium])
//                  .environmentObject(viewModel)
//            }
//            
//                                          }
//    }
//}
//
//#Preview {
//    HomeView(folder: exampleFolder)
//        .environment(GuideViewModel())
//    
//}
