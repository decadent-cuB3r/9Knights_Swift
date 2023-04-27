//
//  CreateEvent.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/10.
//

import SwiftUI
import PhotosUI
import FirebaseFirestore

struct EventImage: View {
    
    @State var data: Data?
    @State var selectedItem: [PhotosPickerItem] = []
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    StandardBackButton()
                    StandardHeader(text: "旅程封面")
                    
                }
                Form {
                              Section {
                                  PhotosPicker(selection: $selectedItem, maxSelectionCount: 1, selectionBehavior: .default, matching:  .images, preferredItemEncoding: .automatic) {
                                      if let data = data, let image = UIImage(data: data) {
                                          Image(uiImage: image)
                                              .resizable()
                                              .scaledToFit()
                                              .frame( maxHeight: 300)
                                      } else {
                                          
                                          Label("Select a picture", systemImage: "photo.on.rectangle.angled")
                                              
                                      }
                                  }.onChange(of: selectedItem) { newValue in
                                      guard let item = selectedItem.first else {
                                          return
                                      }
                                      item.loadTransferable(type: Data.self) { result in
                                          switch result {
                                          case .success(let data):
                                              if let data = data {
                                                  self.data = data
                                              }
                                          case .failure(let failure):
                                              print("Error: \(failure.localizedDescription)")
                                          }
                                      }
                                  }
                              }
                              Section {
                                  Button("Upload to Firebase Storage") {
                                      // Function to post data to Firebase Storage
                                  }.disabled(data == nil)
                              }
                          }
            }
            Divider()
            
            
        }
    }
}

struct EventImage_Previews: PreviewProvider {
    static var previews: some View {
        EventImage()
    }
}
