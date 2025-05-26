//
//  NewAttractionView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-20.
//

import SwiftUI

struct NewAttractionView: View {
    // MARK: Stored properties
    @Binding var city: City
    
    @State var name = ""
    @State var date = Date ()
    @State var address = ""
    @State var rating = Int()
    @State var caption = ""
    @State var isFavourite = false
    @State private var folderImage: Image? = nil
    @State private var showingImagePicker = false
    @State private var inputUIImage: UIImage? = nil
    
    
    @Binding var isShowing: Bool
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 16){
                // Label
                Text ("Attraction Detail")
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                // Textfields
                VStack (spacing: 0){
                    TextField("Name", text: $name)
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
                
                
                
                .navigationTitle("Add Attraction")
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
                            city.attractions.append(
                                Attraction(
                                    id: UUID(),
                                    name: name,
                                    address: address,
                                    latitude: 0.0,
                                    longitude: 0.0,
                                    rating: 0,
                                    description: caption,
                                    isFavourite: isFavourite,
                                    photo: inputUIImage
                                )
                            )
                            isShowing = false
                            
                            //  ➝ Your save logic here
//                            viewModel.addAttraction(newAttraction: Attraction( id: UUID(), name: AttractionName, address: AttractionAddress, latitude: AttractionLatitude, longitude: AttractionLongitude, rating: AttractionRating, description: AttractionDescription, isFavourite: AttractionFavourite))
                            
                            
                        }
                    }
//                    .disabled(folderName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

#Preview {
    NewAttractionView(city: .constant(sampleCities.first!), isShowing: .constant(true))
//        .environment(GuideViewModel())

}
