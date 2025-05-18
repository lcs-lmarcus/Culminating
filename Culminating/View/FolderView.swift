//
//  FolderView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-18.
//

import SwiftUI

struct FolderView: View {
    let providedFolder: TourFolder
    
    var body: some View {
        HStack {
            Image (providedFolder.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text (providedFolder.name)
        }
    }
}

#Preview {
    FolderView(providedFolder: exampleFolder)
}
