//
//  EventDetail.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/28.
//

import SwiftUI
import CoreLocation

import MapKit

struct MapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
        view.setRegion(region, animated: true)
    }
}

struct EventDetail: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isExpanded = false
    @State var select: Int = 0
         var items = ["Day 1"]
    var event: Event

    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
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
                                Rectangle()
                                    .stroke(Color("ItemStroke"), lineWidth: 2)
                                    .background( Color("Gray"))
                                    .cornerRadius(2)
                                    .frame(width: 82, height: 26)
                                Text(tags)
                                    .foregroundColor(Color(.black))
                                    .bold()
                            }
                        }
                        Spacer()
                    }.padding()
                    //Event Name
                    HStack{
                        VStack(alignment: .leading,spacing: 2){
                            Text(event.eventName)
                                .foregroundColor(.black)
                                .font(.system(size: 24, weight: .bold))

                            //Event Date
                            Text("\(event.startDate.formatted(.dateTime.month().day()))")
                                .foregroundColor(Color("WordGray"))
                                .font(.system(size: 14))
                            Text("旅程上限人數  5人")
                                .foregroundColor(Color("WordGray"))
                                .font(.system(size: 14, weight: .regular))
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
                                .foregroundColor(.white).bold()
                            Spacer()
                        }
                        .frame(width: 360, height: 45)
                        .background(Color("Red"))
                        .cornerRadius(20)
                        .padding(5)

                    }
                    VStack(alignment:.leading){
                        Text("介紹").font(.system(size: 18, weight: .bold))
                            .padding(1)
                        Text("歡迎喜歡一起騎車跑山的北部朋友參加我們的活動!\n多多邀請你的朋友來玩吧!\n也歡迎新手加入哦我們人都很好的~\n不管你騎什麼車都可以跟喔哈哈哈")
                            .font(.system(size: 16))
                            .foregroundColor(Color("WordGray"))
                            .lineSpacing(5)
                            .lineLimit(isExpanded ? nil : 3)
    
                    }
                    HStack{
                        Spacer()
                        Button(action: { isExpanded.toggle() }) {
                                        Text(isExpanded ? "收起" : "查看更多")
                                            .font(.system(size: 16))
                                            .foregroundColor(Color("WordGray"))
                                            .bold()
                        }.buttonStyle(StaticButtonStyle())
                    }.padding(.trailing)
                }
                MapView(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
                    .frame(width: 355, height: 200)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                    )
                VStack{
                    SegmentedControl(items: items, selection: $select)
                    Text("出發時間：").bold().padding()
                    Divider()
                    HStack{
                        ZStack{
                            Image("Point")
                            Text("1").foregroundColor(Color("Red")).font(.system(size: 10).bold()).padding(.bottom,8)
                        }.padding()
                        VStack(alignment: .leading, spacing: 4){
                            Text("全家新店長春店").font(.system(size: 16).bold())
                            Text("231新北市新店區北宜路二段149號").font(.system(size: 14))
                            Text("距離下一地點騎車時間約30分").font(.system(size: 14)).foregroundColor(Color("WordGray"))
                        }
                        Button{
                            
                        }label: {
                            ZStack{
                                Image(systemName: "location.circle.fill")
                                    .font(Font.system(size: 28, weight: .bold))
                                    .foregroundColor(.black)
                            }
                        }.padding()
                    }.padding()
                    Divider()
                }.padding(.vertical)
                
            }.navigationBarBackButtonHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
