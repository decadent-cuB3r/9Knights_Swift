//
//  SetupPhoto.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/23.
//

import SwiftUI
import UIKit

struct SUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }

}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    init(image: Binding<Image?>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: image)
        }
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}

struct SetupPhoto: View {
    
    @State private var image: Image? = Image("karthick")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @State private var positionY = 700
    @State var appear = true
    @EnvironmentObject var AuthViewModel: AuthenticationViewModel
//    @Binding var path: NavigationPath
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View {
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Spacer()
            Image("whiteArrow")
                .foregroundColor(.white)
            Spacer()
        }
        .frame(width: 50, height: 50)
        .background(Color("Red"))
        .cornerRadius(50)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 60, trailing: 0))
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color("CreamyWhite")
                .ignoresSafeArea(.all)
            
            VStack{
                HStack{
                    btnBack
                    Spacer()
                }.padding(.top,80)
                VStack{
                    VStack{
                        Text("設定頭像")
                            .padding(20)
                            .font(.system(size: 32,
                                          weight: .bold))
                        
                        // WARNING: Force wrapped image for demo purpose
                        ZStack{
                            if (image == nil){
                                
                            }
                            
                            image!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: 300)
                                .background(Image(systemName: "plus")
                                    .font(.system(size: 100))
                                    .foregroundColor(.gray)
                                    .zIndex(1))
                                .background(Color("Gray"))
                                .cornerRadius(200)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 1))
                                
                                .onTapGesture { self.shouldPresentActionScheet = true }
                                .sheet(isPresented: $shouldPresentImagePicker) {
                                    SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                                }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                                    ActionSheet(title: Text("從相機或相簿選取照片設定您的頭像"), buttons: [ActionSheet.Button.default(Text("拍攝照片"), action: {
                                        self.shouldPresentImagePicker = true
                                        self.shouldPresentCamera = true
                                    }), ActionSheet.Button.default(Text("從相簿中選取"), action: {
                                        self.shouldPresentImagePicker = true
                                        self.shouldPresentCamera = false
                                    }), ActionSheet.Button.cancel()])
                                }
                            
                        }
                        Button {
                            AuthViewModel.authenticationState = .Authenticated
                        } label: {
                            Spacer()
                            Text("確認")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 300, height: 50)
                        .background(Color("BtnBlack"))
                        .cornerRadius(20)
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 10, trailing: 0))
                        Button {
                            
                        } label: {
                            Spacer()
                            Text("稍後設定")
                                .foregroundColor(Color("WordGray"))
                            Spacer()
                        }
                        .cornerRadius(20)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 110, trailing: 0))
                    }
                    
                    .frame(width: 390, height: 700)
                    .background(.white)
                    .cornerRadius(60)
                }
                .offset(y:CGFloat(positionY))
                .animation(.spring(), value: positionY)
                .onAppear(){ if appear{
                    positionY -= 700
                    appear = false
                }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    struct SetupPhoto_Previews: PreviewProvider {
        static var previews: some View {
            SetupPhoto()
        }
    }
}
