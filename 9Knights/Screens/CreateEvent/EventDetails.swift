//
//  EventDetails.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/28.
//

import SwiftUI
import Combine
struct EventDetailsNavigationBar: View {
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
                Text("旅程內容").font(.system(size: 24)).bold()
                Spacer()
                NavigationLink(destination: EventDetails()){ Text("完成").foregroundColor(Color("Red")).font(.system(size: 20)).bold() }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
    }
}
struct EventDetails: View {
    
    @State private var text: String = ""
    @State private var text2: String = ""
    @State private var isKeyboardShown = false
    let options = ["北部", "中部", "南部", "東部"]
    let properties = ["車聚", "跑山", "旅遊", "休閒"]
    @State private var selectedOption: String?
    @State private var selectedproperties: String?
    let columns = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        NavigationStack{
            VStack{
                EventDetailsNavigationBar()
                VStack{
                    VStack(alignment: .leading, spacing: 10){
                        HStack{
                            Text("標籤").font(.system(size: 20)).bold()
                            Spacer()
                        }
                        HStack(spacing: 20){
                            Text("地區")
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
                        }
                        HStack(spacing: 20){
                            Text("性質")
                            ForEach(properties, id: \.self) { properties in
                                Button(action: {
                                    self.selectedproperties = properties
                                }, label: {
                                    Text(properties)
                                        .font(.system(size: 12)).bold()
                                        .padding()
                                        .frame(width: 60, height: 26)
                                        .foregroundColor(Color("WordGray"))
                                        .background(self.selectedproperties == properties ? Color("Gray") : Color.white)
                                        .border(self.selectedproperties == properties ? Color("TagGray") : Color("WordGray"))
                                    
                                }).buttonStyle(StaticButtonStyle())
                            }
                        }
                    }
                    
                    Divider()
                    HStack{
                        Text("標題").font(.system(size: 20)).bold()
                        Spacer()
                    }
                    VStack {
                        TextField("輸入標題...", text: $text)
                    }
                    //                        .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    //                            self.isKeyboardShown = keyboardHeight > 0
                    //                        }
                    Divider()
                    HStack{
                        Text("介紹").font(.system(size: 20)).bold()
                        Spacer()
                    }
                    VStack{
                        TextField("寫下您想如何介紹您的旅程...", text: $text)
                    }
                }.frame(maxWidth: 360).padding(.vertical)
                Divider()
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("開始日期").font(.system(size: 20)).bold()
                            TextField("輸入標題...", text: $text)
                        }
                        Divider()
                        VStack(alignment: .leading){
                            Text("結束日期").font(.system(size: 20)).bold()
                            TextField("輸入標題...", text: $text)
                        }.padding(.leading,10)
                    }.frame(height:100)
                    Divider()
                    HStack{
                        VStack(alignment: .leading){
                            Text("天數").font(.system(size: 20)).bold()
                            TextField("輸入標題...", text: $text)
                        }
                        Divider()
                        VStack(alignment: .leading){
                            Text("人數上限").font(.system(size: 20)).bold()
                            TextField("輸入標題...", text: $text)
                        }.padding(.leading,10)
                    }.frame(height:100)
                    Divider()
                    HStack{
                        VStack(alignment: .leading, spacing: 10){
                            Text("行程規劃").font(.system(size: 20)).bold()
                            NavigationLink(destination: EventDetails()){
                                Text("新增行程中途點")
                                    .foregroundColor(Color("WordGray"))
                            }
                        }
                        Spacer()
                    }
                }.frame(maxWidth: 360)
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct EventDetails_Previews: PreviewProvider {
    static var previews: some View {
        EventDetails()
    }
}
