//
//  TabButton.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/15.
//

import SwiftUI
import UIKit

//Static Button
struct StaticButtonStyle: ButtonStyle{
    func makeBody (configuration: Configuration) -> some View{
        configuration.label
    }
}

struct Popup: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showModal: Bool
    
    var body: some View{
        
            ZStack(alignment: .topLeading){
                Color.white
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(20)
                VStack{
                    Button(
                        action: {
                            showModal.toggle()
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 20,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(.gray)
                                .font(.largeTitle)
                                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
                        }
                    ).frame(width: 390, alignment: .trailing)

                    HStack{
                        
                        Button(
                            action: {
                                
                            }, label: {
                                VStack(alignment: .leading){
                                    Text("創建旅程")
                                        .font(.system(size: 24,
                                                      weight: .bold))
                                        .foregroundColor(.black)
                                        .padding(.bottom, 0.5)
                                    Text("創建行程認識更多車友吧！")
                                        .font(.system(size: 16))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }).frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 10, trailing: 10))
                            
                    }
                    Divider()
                    HStack{
                        Button(
                            action: {
                                
                            }, label: {
                                VStack(alignment: .leading){
                                    Text("發布貼文")
                                        .font(.system(size: 24,
                                                      weight: .bold))
                                        .foregroundColor(.black)
                                        .padding(.bottom, 0.5)
                                    Text("分享您的經驗與體悟給大家吧！")
                                        .font(.system(size: 16))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }).frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 10))
                    }
                }
                
            }.edgesIgnoringSafeArea(.all)
                .padding(.top,620)
                
    }
}

struct PopBackground: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showModal: Bool
    
    var body: some View{
        ZStack{
            Color.black.opacity(0.3)
                .onTapGesture {
                    showModal.toggle()
                }
        }.edgesIgnoringSafeArea(.all)
            
    }
}

struct TabButton: View {
    @State var selectedIndex = 0

    @State private var showModal = false

    
    let icons = [
        "house",
        "map",
        "plus",
        "message",
        "person.circle"
    ]
    
    let tabWords = [
        "探索",
        "地圖",
        "",
        "交流",
        "個人"
    ]
    
    
    
    struct Triangle : Shape {
        
        func path(in rect: CGRect) -> Path {
            var path = Path()

            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            

            return path
        }
    }

    
    var body: some View {

        ZStack{
                ZStack{
                    
                    switch selectedIndex {
                    case 0 :
                        Explore()
                    case 1 :
                        NavigationView{
                            VStack{
                                Text("First Screen")
                            }
                            .navigationTitle("Map")
                        }
                    case 3 :
                        NavigationView{
                            VStack{
                                Text("First Screen")
                            }
                            .navigationTitle("Communication")
                        }
                    default:
                        NavigationView{
                            VStack{
                                Text("Second Screen")
                            }
                            .navigationTitle("Person")
                        }
                    }
                    
                }
                
            ZStack(alignment: .bottomLeading){
                    ZStack{
                        if showModal{
                            PopBackground( showModal: $showModal )
                                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.3)))
                        }
                    Popup(showModal: $showModal)
                        .offset(y: showModal ? 0 : UIScreen.main.bounds.height)
                        .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 0.5), value: showModal)
                        
                    }.zIndex(101)
                    ZStack{
                        HStack{
                            ForEach(0..<5, id: \.self ){ number in
                                Spacer()
                                Button( action: {
                                    if number == 2{
                                        showModal.toggle()
                                    }else{
                                        self.selectedIndex = number
                                    }
                                }, label: {
                                    if number == 2{
                                        VStack{
                                            Image(systemName: icons[number])
                                            
                                                .font(.system(size: 80,
                                                              weight: .regular,
                                                              design: .default))
                                                .foregroundColor( .white )
                                                .frame(width: 60)
                                                .padding(-2)
                                        }.cornerRadius(10)
                                    }else{
                                        VStack{
                                            Image(systemName: icons[number])
                                                .font(.system(size: 25,
                                                              weight: .regular,
                                                              design: .default))
                                                .foregroundColor( selectedIndex == number ? Color(red: 0.8549, green: 0.3098, blue: 0.251, opacity: 1) : Color(UIColor.lightGray))
                                            Text(tabWords[number])
                                                .font(.system(size: 10))
                                                .padding(1)
                                                .foregroundColor(selectedIndex == number ? Color(red: 0.8549, green: 0.3098, blue: 0.251, opacity: 1) : Color(UIColor.lightGray))
                                        }
                                    }
                                }
                                )
                                .buttonStyle(StaticButtonStyle())
                                Spacer()
                            }
                            .frame(maxWidth: 30, maxHeight: 90)
                            .padding(.bottom, 10)
                        }
                        .background(.white)
                        .cornerRadius(30)
                        .shadow(color: Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.5) ,radius: 5)
                        
                        Button( action: {
                            
                        }, label: {
                            VStack{
                                Image(systemName: icons[2])
                                    .font(.system(size: 40,
                                                  weight: .regular,
                                                  design: .default))
                                    .foregroundColor( .white )
                                    .frame(width: 70, height: 60)
                                    .background( Color(red: 0.8549, green: 0.3098, blue: 0.251, opacity: 1 ))
                                    .padding(.bottom,-8)
                                Triangle()
                                    .frame(width: 70, height: 25)
                                    .padding(0)
                                    .foregroundColor( Color(red: 0.8549, green: 0.3098, blue: 0.251, opacity: 1 ))
                            }
                            .cornerRadius(10)
                            .frame(width: 0, height: 0)
                        })
                        .padding(.bottom, 40)
                    }
                }.edgesIgnoringSafeArea(.all)
            }
            
        
            
        }
    
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton()
    }
}
