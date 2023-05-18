//
//  CreateEvent.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/10.
//

import SwiftUI
import PhotosUI
import FirebaseStorage
struct EventImageNavigationBar: View {
    @State private var isPresented = false
    @State private var isPresentedright = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
                .shadow(color: Color.gray.opacity(0.05), radius: 4, x: 0, y: 4)
                .frame(width: 390,height: 70)
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    ZStack{
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("Gray"))
                            .opacity(0.5)
                        Image("BlackArrowLeft")
                            .font(Font.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                Text("旅程封面").font(.system(size: 20)).bold()
                    .padding(.leading, 20)
                Spacer()
                NavigationLink(destination: EventDetails()){ Text("下一步").foregroundColor(Color("Red")).font(.system(size: 18)).bold() }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
        .padding(.bottom,20)
    }
}
struct EventImage: View {
    
    @State public var data: Data?
    @State var selectedItem: [PhotosPickerItem] = []
    let storageReference = Storage.storage().reference().child("\(UUID().uuidString)")
    
    var body: some View {
        NavigationStack{
            VStack{
                EventImageNavigationBar()
                VStack{
                    VStack {
                        
                        PhotosPicker(selection: $selectedItem, maxSelectionCount: 1, selectionBehavior: .default, matching:  .images, preferredItemEncoding: .automatic) {
                            if let data = data, let image = UIImage(data: data) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame( maxHeight: 300)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 320, height: 235)
                                    .background(Color("Gray"))
                                    .cornerRadius(10)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                            } else {
                                Image("")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 320, height: 235)
                                    .background(Image(systemName: "plus")
                                        .font(.system(size: 70))
                                        .foregroundColor(.gray)
                                        .zIndex(1))
                                    .background(Color("Gray"))
                                    .cornerRadius(10)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
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
                    }.padding()
                    VStack {
                        Button {

                        } label: {
                            Spacer()
                            Text("選擇預設圖片")
                                .foregroundColor(.white).bold()
                            Spacer()
                        }
                        .frame(width: 320, height: 50)
                        .background(Color("BtnBlack"))
                        .cornerRadius(20)
                    }
                    VStack {
                        Button("Upload to Firebase Storage") {
                            //MARK Function to post data to Firebase Storage
                            storageReference.putData(data!, metadata: nil) { (metadata, error) in
                                guard let metadata = metadata else { return }
                            }
                        }.disabled(data == nil)
                    }.padding()
                    
                }
                  Spacer()
            }
        }
    }
}

struct EventImage_Previews: PreviewProvider {
    static var previews: some View {
        EventImage()
    }
}
