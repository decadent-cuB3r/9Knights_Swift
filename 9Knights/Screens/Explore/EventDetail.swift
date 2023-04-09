//
//  EventDetail.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/28.
//

import SwiftUI



struct EventDetail: View {
    
    
    var event: Event
    @Environment(\.presentationMode) var presentationMode
    

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ZStack{
                        ZStack(alignment: .top){
                            Rectangle()
                                .foregroundColor(Color("ItemShadow"))
                                .frame(width: 385, height: 222)
                                .cornerRadius(20,corners: [.bottomLeft, .bottomRight])
                                .padding(.trailing, 0)
                            //Event Image
                            AsyncImage(url: URL(string: event.photo)){ image in
                                image.resizable()
                                    .cornerRadius(10)
                                    .padding(.top,-5)
                            } placeholder: {
                                ProgressView()
                            }
                            .foregroundColor(Color("WordGray"))
                            .frame(width: 392, height: 212)
                            .cornerRadius(20,corners: [.bottomLeft, .bottomRight])
                            HStack{
                                VStack(alignment: .leading){
                                    
                                    Button{
                                        self.presentationMode.wrappedValue.dismiss()
                                    }label: {
                                        ZStack{
                                            Circle()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(Color("Gray"))
                                                .opacity(0.5)
                                            Image("whiteArrow")
                                                .font(Font.system(size: 20, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }.padding()
                                Spacer()
                                VStack(alignment: .trailing){
                                    Button{
                                        
                                    }label: {
                                        ZStack{
                                            Circle()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(Color("Gray"))
                                                .opacity(0.5)
                                            Image(systemName: "square.and.arrow.up")
                                                .font(Font.system(size: 20, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                VStack(alignment: .trailing){
                                    
                                    Button{
                                        
                                    }label: {
                                        ZStack{
                                            Circle()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(Color("Gray"))
                                                .opacity(0.5)
                                            Image(systemName: "ellipsis")
                                                .font(Font.system(size: 20, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }.padding().padding(.leading, -10)
                                
                            }
                            
                            
                        }
                    }
                    HStack{
                        ForEach(event.tags, id: \.self){ tags in
                            ZStack{
                                Capsule()
                                    .stroke(Color("ItemStroke"), lineWidth: 2)
                                    .background( Color("CreamyWhite"))
                                    .cornerRadius(20)
                                    .frame(width: 80, height: 30)
                                Text(tags)
                                    .foregroundColor(Color(.black))
                                    .bold()
                            }
                        }
                        Spacer()
                    }.padding()
                    //Event Name
                    HStack{
                        VStack(alignment: .leading){
                            Text(event.eventName)
                                .foregroundColor(.black)
                                .font(.system(size: 24, weight: .bold))
                                .padding(.bottom,0.1)
                            Spacer()
                            //Event Date
                            Text("\(event.startDate.formatted(.dateTime.month().day()))")
                                .foregroundColor(Color("WordGray"))
                                .font(.system(size: 14, weight: .bold))
                                .padding(.bottom, 0.1)
                            
                            //Event Host 待翻譯中文
                            Text("由 \(event.host) 創建")
                                .foregroundColor(Color("WordGray"))
                                .font(.system(size: 14, weight: .regular))
                            
                        }
                        Spacer()
                    }.padding(.leading,20)
                    ZStack{
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(Color("ItemStroke"), lineWidth: 1)
                            .background(.white)
                            .cornerRadius(10)
                            .frame(width: 360, height: 80)
                        HStack{
                            VStack{
                                Text("旅程團員").font(.system(size: 14, weight: .bold))
                                    .padding(.horizontal)
                                    .padding(.bottom,-1)
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .padding(.horizontal,-30)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack{
                                Button{
                                    
                                }label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .stroke(Color("ItemStroke"), lineWidth: 1)
                                            .background(Color("CreamyWhite"))
                                            .cornerRadius(10)
                                            .frame(width: 28, height: 57)
                                        Image("BlackArrowRight")
                                    }
                                    
                                }.padding(.trailing)
                            }
                            
                        }
                        
                    }.padding()
                    if event.startDate == Date.now {
                        Button{
                            
                        }label: {
                            Spacer()
                            Text("開始騎乘")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 360, height: 45)
                        .background(Color("Red"))
                        .cornerRadius(20)
                        .padding(1)
                    } else {
                        Button{
                            
                        }label: {
                            Spacer()
                            Text("報名參加")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 360, height: 45)
                        .background(Color("Red"))
                        .cornerRadius(20)
                        .padding(1)

                    }
                    HStack{
                        VStack(alignment: .leading){
                            Text("介紹").font(.system(size: 18, weight: .bold))
                                .padding(.bottom,1)
                            Text("歡迎喜歡一起騎車跑山的北部朋友參加我們的活動!本活動不限人數自由參加!也歡迎新手加入哦我們人都很好的~")
                                .font(.system(size: 16))
                                .foregroundColor(Color("WordGray"))
                            
                        }
                        Spacer()
                    }.padding()
                    
                }
                
            }.navigationBarBackButtonHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
