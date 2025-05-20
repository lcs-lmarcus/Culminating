//
//  NewFolderView.swift
//  Culminating
//
//  Created by Marcus Li on 2025-05-20.
//

import SwiftUI

struct NewFolderView: View {
    @Environment(\.dismiss) private var dismiss

    // MARK: – Form state
    @State private var folderName: String = ""
    @State private var folderImage: Image? = nil
    @State private var showingImagePicker = false
    @State private var inputUIImage: UIImage? = nil

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                // 1) Section label
                Text("Folder Detail")
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.gray)
                    .padding(.horizontal)

                // 2) Card container
                VStack(spacing: 0) {
                    // — Top row: Name field
                    TextField("Name", text: $folderName)
                        .padding(.horizontal)
                        .frame(height: 44)
                        .background(Color(.systemGray5))

                    Divider()

                    // — Bottom row: Camera / image picker
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
                }
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.separator), lineWidth: 1)
                )
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Add Folder")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        //  ➝ Your save logic here
                        dismiss()
                    }
                    .disabled(folderName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
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
        }
    }
}

// A simple UIKit image‐picker bridge
struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.dismiss) private var dismiss
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    func makeCoordinator() -> Coordinator { Coordinator(self) }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        init(_ parent: ImagePicker) { self.parent = parent }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let ui = info[.originalImage] as? UIImage {
                parent.image = ui
            }
            parent.dismiss()
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}


#Preview {
    NewFolderView()
}
