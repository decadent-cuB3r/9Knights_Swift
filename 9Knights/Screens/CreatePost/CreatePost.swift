//
//  CreatePost.swift
//  9Knights
//
//  Created by Peggy on 2023/5/9.
//
import SwiftUI
import Combine

struct CreatePostNavigationBar: View {
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
                Text("發布貼文").font(.system(size: 24)).bold()
                Spacer()
                NavigationLink(destination: TabButton()){ Text("完成").foregroundColor(Color("Red")).font(.system(size: 20)).bold() }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
    }
}
struct CreatePost: View {
    
    let options = ["心得", "徵人", "路況", "詢問"]
    
    @State private var introtext: String = ""
    @State private var titletext: String = ""
    @State private var isKeyboardShown = false
    @State private var selectedOption: String?
    @State private var isShowingImagePicker = false
    @State private var selectedImages: [UIImage] = []
    let numbers = Array(1...10)
    
    var body: some View {
        NavigationStack{
            VStack{
                CreatePostNavigationBar()
                VStack{
                    HStack(spacing: 19.8){
                        Text("標籤").font(.system(size: 20)).bold()
                        ForEach(options, id: \.self) { option in
                            Button(action: {
                                self.selectedOption = option
                            }, label: {
                                Text(option)
                                    .font(.system(size: 12)).bold()
                                    .padding()
                                    .frame(width: 60, height: 26)
                                    .foregroundColor(Color("WordGray"))
                                    .background(self.selectedOption == option ? Color("Gray") : Color.white)
                                    .border(self.selectedOption == option ? Color("TagGray") : Color("WordGray"))
                                
                            }).buttonStyle(StaticButtonStyle())
                        }
                    }.frame(maxWidth: 360).padding(.vertical)
                    Divider()
                    VStack{
                        HStack{
                            Text("標題").font(.system(size: 20)).bold()
                            Spacer()
                        }
                        VStack {
                            TextField("輸入標題...", text: $titletext)
                        }
                    }.padding(.vertical).frame(maxWidth: 360, maxHeight: 80)
                    
                    //                        .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    //                            self.isKeyboardShown = keyboardHeight > 0
                    //                        }
                    Divider()
                    HStack{
                        Text("內容").font(.system(size: 20)).bold()
                        Spacer()
                    }.frame(maxWidth: 360)
                    VStack {
                        TextEditorWithPlaceholder(introtext: $introtext, text: "寫下您想分享的內容...").frame(height: 200)
                        
                    }.frame(maxWidth: 360)
                    VStack {
                        Spacer()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(selectedImages, id: \.self) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(10)
                                    Button(action: {
                                                selectedImages.removeAll(where: { $0 == image })
                                            }) {
                                                VStack{
                                                    Image(systemName: "x.circle.fill")
                                                        .foregroundColor(Color("WordGray"))
                                                    Spacer()
                                                }.padding(.trailing,10)
                                            }
                                }
                            }.padding()
                        }
                        Divider()
                        HStack{
                            Button {
                                isShowingImagePicker.toggle()
                            }label: {
                                HStack{
                                    Image(systemName: "photo.on.rectangle")
                                        .font(.system(size: 24))
                                        .foregroundColor(Color("WordGray"))
                                    Text("上傳圖片")
                                }
                            }
                            .sheet(isPresented: $isShowingImagePicker) {
                                ImagePicker(selectedImages: $selectedImages)
                            }.font(.system(size: 20)).bold().foregroundColor(Color("WordGray"))
                            Spacer()
                        }.padding()
                    }
                }.padding(.top)
            }
            Spacer()
        }.navigationBarBackButtonHidden(true)
    }
}
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImages: [UIImage]
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePicker: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let imagePicker: ImagePicker
        
        init(imagePicker: ImagePicker) {
            self.imagePicker = imagePicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.originalImage] as? UIImage {
                imagePicker.selectedImages.append(image)
            }
            
            imagePicker.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            imagePicker.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct CreatePost_Previews: PreviewProvider {
    static var previews: some View {
        CreatePost()
    }
}
