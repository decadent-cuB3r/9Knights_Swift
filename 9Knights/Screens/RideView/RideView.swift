//
//  Notifications.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/27.
//

import SwiftUI
import MapKit

struct RideView: View {
    @State var informationShow: Bool = true
    @StateObject private var viewModel = UserLocationViewModel()
    @Environment(\.dismiss) private var dismiss
    @State var offset : CGFloat = 80
    @Binding var hideTab: Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    .onAppear{
                        viewModel.checkIfLocationServicesIsEnabled()
                    }
                VStack{
                    HStack{
                        Button{
                        action: do {dismiss()}; hideTab = false
                        }label: {
                            ZStack{
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color.white)
                                    .opacity(0.8)
                                Image(systemName: "arrow.backward.to.line")
                                    .font(Font.system(size: 20, weight: .semibold))
                                    .foregroundColor(Color("BtnGray"))
                            }
                        }
                        Spacer()
                        NavigationLink(destination: RideSetting(hideTab: $hideTab)){
                            ZStack{
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color.white)
                                    .opacity(0.8)
                                Image(systemName: "gearshape.fill")
                                    .font(Font.system(size: 20, weight: .semibold))
                                    .foregroundColor(Color("BtnGray"))
                            }
                        }
                    }.padding().frame(height: 70)
                    Spacer()
                    GeometryReader { geometry in
                        ButtomMember()
                            .offset(y: geometry.frame(in: .global).height - 150)
                            .offset(y: offset)
                            .gesture(DragGesture().onChanged({ (value) in
                                withAnimation{
                                    if value.startLocation.y > geometry.frame(in: .global).midX{
                                        if value.translation.height < 0 && offset > (-geometry.frame(in: .global).height + 150){
                                            offset = value.translation.height
                                        }
                                    }
                                    
                                    if value.startLocation.y < geometry.frame(in: .global).midX{
                                        if value.translation.height > 0 && offset < 0{
                                            offset = (-geometry.frame(in: .global).height + 150) + value.translation.height
                                        }
                                        
                                    }
                                }
                            }).onEnded({ (value) in
                                
                                withAnimation{
                                    if value.startLocation.y > geometry.frame(in: .global).midX{
                                        
                                        if -value.translation.height > geometry.frame(in: .global).midX{
                                            offset = (-geometry.frame(in: .global).height + 150)+70
                                            
                                            return
                                        }
                                        offset = 0
                                    }
                                    if value.startLocation.y > geometry.frame(in: .global).midX{
                                        
                                        if value.translation.height < geometry.frame(in: .global).midX{
                                            offset = (-geometry.frame(in: .global).height + 150)+70
                                            
                                            return
                                        }
                                        offset = 0
                                    }
                                }
                                
                            }))
                    }
                    ZStack{
                        
                        Rectangle()
                            .frame(width: 390,height: 95)
                            .foregroundColor(Color("Gray"))
                        HStack(spacing: 30){
                            NavigationLink(destination: RideInfo(hideTab: $hideTab)){
                                ZStack{
                                    Circle()
                                        .frame(width: 62, height: 62)
                                        .foregroundColor(Color.white)
                                        .opacity(0.8)
                                    Image(systemName: "info.circle.fill")
                                        .font(Font.system(size: 30, weight: .semibold))
                                        .foregroundColor(Color("BtnGray"))
                                }
                            }
                            Button{
                                
                            }label: {
                                HStack{
                                    Image(systemName: "mic.fill")
                                        .font(Font.system(size: 24, weight: .semibold))
                                        .foregroundColor(Color.white)
                                    Text("通話")
                                        .font(Font.system(size: 24, weight: .semibold))
                                        .foregroundColor(Color.white)
                                }
                                .frame(width: 157, height: 57)
                                .background(Color("Red"))
                                .cornerRadius(30)
                                
                            }
                            NavigationLink(destination: ChatView(hideTab: $hideTab)){
                                ZStack{
                                    Circle()
                                        .frame(width: 62, height: 62)
                                        .foregroundColor(Color.white)
                                        .opacity(0.8)
                                    Image(systemName: "message.fill")
                                        .font(Font.system(size: 28, weight: .semibold))
                                        .foregroundColor(Color("BtnGray"))
                                }
                                
                            }
                        }
                    }.background(Color.white.edgesIgnoringSafeArea(.bottom))
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
            .onAppear {
                hideTab = true
                        }

    }
}
struct ButtomMember: View {
    var body: some View {
        Button{
            
        }label: {
            ZStack{
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("Red"))
                Image(systemName: "location.fill")
                    .foregroundColor(Color.white)
                    .font(Font.system(size: 30))
            }
        }.offset(x: 320,y: -70)
        VStack {
                Capsule()
                     .fill(Color.gray.opacity(0.5))
                     .frame(width: 50,height: 5)
                     .padding(.top)
            ScrollView(.vertical, showsIndicators: false){
                HStack{
                    Text("活動成員狀態")
                        .font(Font.system(size: 16, weight: .semibold))
                        .foregroundColor(Color("WordGray"))
                        .padding(.horizontal)
                    Spacer()
                }

            }
            .padding(.top)
        }.background(Color.white).cornerRadius(15)
    }
}




struct RideView_Previews: PreviewProvider {
    @State static private var hideTab = true
    static var previews: some View {
        RideView(hideTab: $hideTab)
    }
}

