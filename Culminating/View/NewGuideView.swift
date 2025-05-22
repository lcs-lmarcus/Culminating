//
//  NewGuideView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-20.
//

import SwiftUI

struct NewGuideView: View {
    // MARK: Stored properties
    @Environment(NewViewModel.self) var viewModel
  
    
    @State var guideName = ""
    @State var date = Date ()
    @State var address = ""
    @State var rating = Int()
    @State var caption = ""
    @State private var folderImage: Image? = nil
    @State private var showingImagePicker = false
    @State private var inputUIImage: UIImage? = nil
    
    @State  var GuideName: String = ""
    @State  var GuideDate: String = ""
    @State  var GuideAdress: String = ""
    @State  var GuideImage: String = ""
    @State  var GuideCaption: String = ""
    @State  var GuideFolder: String = ""
    @State  var GuideRating: Double = 0.0
    
    
    
   
    
    
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 16){
                // Label
                Text ("Guide Detail")
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                // Textfields
                VStack (spacing: 0){
                    TextField("Name", text: $guideName)
                        .padding(.horizontal)
                        .frame(height: 44)
                        .background(Color(.systemGray5))
                    Divider()
                    
                    // From ChatGPT
                        
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                        .foregroundStyle(Color.gray)
                        .padding(.horizontal)
                        .frame(height: 44)
                        .background(Color(.systemGray5))
                    Divider()
                    TextField("Address", text: $address)
                        .padding(.horizontal)
                        .frame(height: 44)
                        .background(Color(.systemGray5))
                    Divider()
                    Button {
                        showingImagePicker = true
                    } label: {
                        if let folderImage = folderImage {
                            folderImage
                                .resizable()
                                .scaledToFill()
                                .frame(height: 120)
                                .clipped()
                        } else {
                            Image(systemName: "camera")
                                .font(.title2)
                                .frame(maxWidth: .infinity, minHeight: 120)
                                .foregroundColor(.black.opacity(0.6))
                        }
                    }
                    .background(Color(.systemGray5))
                    // Selecting Folder
                    
                    
                }
                Text ("Rating")
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                HStack {
                    Picker ("Rating", selection: $rating) {
                        ForEach(1...5, id: \.self) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .frame(width: 400, height: 44)
                .background(Color(.systemGray5))
                
                Text("Caption")
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                TextField("Add Caption", text: $caption)
                    .padding(.horizontal)
                    .frame(height: 44)
                    .background(Color(.systemGray5))
                
                Spacer()
                
                
                
                .navigationTitle("Add Guide")
            }
            
            // MARK: – Image picker sheet
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputUIImage)
                    .onChange(of: inputUIImage) { newImage in
                        if let ui = newImage {
                            folderImage = Image(uiImage: ui)
                        }
                    }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        withAnimation {
                            //  ➝ Your save logic here
                            viewModel.add(newGuide: TourGuide(name: GuideName, date: GuideDate, address: GuideAdress, folder: GuideFolder, image: GuideImage, rating: GuideRating, caption: GuideCaption))
                            
                        }
                    }
//                    .disabled(folderName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

#Preview {
    NewGuideView()
        .environment(NewViewModel())

}
