//
//  GuideView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-04-21.
//

import SwiftUI

struct GuideDetailView: View {
    let guideToShow : TourGuide
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .bottom) {
                    Text (guideToShow.name)
                        .padding(.trailing)
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
            }
            .navigationTitle(guideToShow.name)
        }
    }
}

#Preview {
    GuideDetailView(guideToShow: exampleTourGuide)
}
