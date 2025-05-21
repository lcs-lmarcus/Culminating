//
//  GuideView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-04-21.
//

import SwiftUI

struct GuideDetailView: View {
    @Environment(GuideViewModel.self)     var viewModel
    @Environment(\.dismiss) private var dismiss
    
    let guideToShow : TourGuide
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .bottom) {
                    Text (guideToShow.folder)
                    Spacer()
                        .padding(.horizontal)
                }
                .foregroundStyle(.gray)
                .font(.system(size: 20))
                Spacer()
                
                HStack {
                    Image (guideToShow.image)
                        .resizable()
                        .frame(width: 180, height: 250)
                        .padding(.trailing)
                    VStack {
                        Text ("Date")
                        Text (guideToShow.date)
                            .padding(.bottom)
                        Text ("Address")
                        Text (guideToShow.address)
                            .padding(.bottom)
                        Text ("Folder")
                        Text (guideToShow.folder)
                        
                    }
                }
                Spacer()
                
//                Button(action: {
//                    delete(item: item)
//                }) {
//                    Image(systemName: "trash")
//                        .foregroundColor(.red)
//                }
//                .buttonStyle(BorderlessButtonStyle())
                
                    .navigationTitle(guideToShow.name)
            }
        }
        
    }
}

#Preview {
    GuideDetailView(guideToShow: exampleTourGuide[0])
        .environment(GuideViewModel())
}
