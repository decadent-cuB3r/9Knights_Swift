//
//  Map.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI
import MapKit
struct ReMapView: UIViewRepresentable {
    
    let latitude: Double
    let longitude: Double
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
        mapView.setRegion(MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)), animated: true)
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        mapView.isUserInteractionEnabled = false
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}
struct RecommendNavigationBar: View {
    @State private var isPresented = false
    @State private var isPresentedright = false
    @Binding var hideTab: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
            HStack {
                Text("旅程").font(.system(size: 32)).bold()
                Spacer()
                HStack{
                    NavigationLink(destination: RecommendedChat(hideTab: $hideTab)){
                    label: do {
                            ZStack{
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color("Gray"))
                                Image(systemName: "message")
                                    .font(Font.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color("BtnGray"))
                            }}
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
    }
}



struct RecommendRoot: View {
    let days = ["週三", "週四", "週五", "週六", "週日", "週一"]
    let cities = ["台北市", "新北市", "桃園市", "台中市", "台南市", "高雄市"]
    @State private var selectedCity = "台北市"
    @Binding var hideTab: Bool

    var body: some View {
        NavigationView{
            NavigationStack{
                RecommendNavigationBar(hideTab: $hideTab)
                ScrollView(showsIndicators: false){
                        ScrollView(.horizontal, showsIndicators: false){
                            //UpcomingEvent tile
                            ZStack{
                                Rectangle()
                                    .foregroundColor(Color("ItemShadow"))
                                    .cornerRadius(10)
                                    .frame(width: 316, height: 205)
                                    .offset(y:8)
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(Color("ItemStroke"), lineWidth: 2)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .frame(width: 326, height: 208)
                                VStack(alignment: .leading, spacing: 5){
                                    Text("北宜公路一日遊")
                                        .font(.system(size: 20)).bold()
                                    Text("5月31日, 週二 8:00  - 5月31日, 週二 15:00 ")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color("WordGray"))
                                    HStack{
                                        ReMapView(latitude: 25.032968, longitude: 121.565429)
                                                    .frame(width: 145, height: 116)
                                                    .cornerRadius(10)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color("ItemStroke"), lineWidth: 1))
                                                    .padding(.vertical,5)
                                        VStack(alignment: .leading){
                                            Text("旅程成員")
                                                .font(.system(size: 12)).bold()
                                                .foregroundColor(Color("WordGray"))
                                            Circle()
                                                .frame(width: 35, height: 35)
                                                .foregroundColor(.gray)
                                            NavigationLink(destination: RideView(hideTab: $hideTab)){
                                            label: do {
                                                Text("開始旅程")
                                                    .frame(width: 132, height: 32)
                                                    .font(.system(size: 16)).bold()
                                                    .background(Color("Red"))
                                                    .cornerRadius(20)
                                                    .padding(.top,10)
                                                    .foregroundColor(Color.white)
                                            }
                                            }
                                        }.padding(5)
                                    }
                                }
                                .frame(width: 326, height: 208)
                            }.frame(height: 250).padding(.leading,30)
                            
                        }
                        .frame(height: 270)
                        .background(Color("Gray"))
                    ZStack{
                        VStack{
                            //氣象資料--------------------------------------------
                            VStack{
                                HStack{
                                    Text("5/31").font(.system(size: 32)).bold()
                                    Text("週二").font(.system(size: 24)).bold()
                                    Spacer()
                                    Menu{
                                        Picker(selection: $selectedCity) {
                                                            ForEach(cities, id: \.self) {
                                                                Text($0)
                                                            }
                                        } label: {}
                                    } label: {
                                        HStack{
                                            Text(self.selectedCity)
                                                .font(.system(size: 20)).bold()
                                                .foregroundColor(.black)
                                            Image(systemName: "chevron.down")
                                                .foregroundColor(Color("WordGray"))
                                                .padding(-5)
                                        }
                                        .frame(width: 95, height: 37)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("ItemStroke"), lineWidth: 1))
                                    }
                                }.padding(.horizontal,20)
                                HStack{
                                    Image(systemName: "sun.max.fill")
                                        .font(.system(size: 50)).foregroundColor(.yellow)
                                    VStack(alignment: .leading){
                                        Text("27°").font(.system(size: 24)).bold()
                                        Text("最高 30° 最低 25°")
                                            .font(.system(size: 12)).bold()
                                            .foregroundColor(Color("WordGray"))
                                    }
                                    Rectangle()
                                        .frame(width: 1, height: 50)
                                        .foregroundColor(Color("ItemStroke"))
                                        .padding(.vertical, 10)
                                    HStack(spacing: 10){
                                        VStack(spacing: 2){
                                            Text("今日白天")
                                                .font(.system(size: 10)).bold()
                                                .foregroundColor(Color("WordGray"))
                                            Image(systemName: "sun.max.fill")
                                                .font(.system(size: 20)).foregroundColor(.yellow)
                                            HStack{
                                                Image(systemName: "umbrella.fill")
                                                    .font(.system(size: 10))
                                                    .foregroundColor(Color("LightBlue"))
                                                Text("0%")
                                                    .font(.system(size: 10))
                                                    .foregroundColor(Color("LightBlue"))
                                                    .padding(.horizontal,-5)
                                            }
                                        }
                                        VStack(spacing: 2){
                                            Text("今日晚上")
                                                .font(.system(size: 10)).bold()
                                                .foregroundColor(Color("WordGray"))
                                            Image(systemName: "sun.max.fill")
                                                .font(.system(size: 20))  .symbolRenderingMode(.multicolor)
                                            HStack{
                                                Image(systemName: "umbrella.fill")
                                                    .font(.system(size: 10))
                                                    .foregroundColor(Color("LightBlue"))
                                                Text("0%")
                                                    .font(.system(size: 10))
                                                    .foregroundColor(Color("LightBlue"))
                                                    .padding(.horizontal,-5)
                                            }
                                        }
                                    }.padding(.horizontal,10)
                                }.padding(-10)
                                Divider().frame(width: 306).padding(5)
                                HStack{
                                    Text("一週內天氣")
                                        .font(.system(size: 14)).bold()
                                    Spacer()
                                }.padding(.horizontal,20)
                                LazyHGrid(rows: [GridItem(.flexible())]) {
                                                ForEach(0..<days.count, id: \.self) { index in
                                                    VStack {
                                                        Text(days[index])
                                                            .font(.system(size: 12))
                                                            .foregroundColor(Color("WordGray"))
                                                        Image(systemName: "sun.max.fill")
                                                            .resizable()
                                                            .symbolRenderingMode(.multicolor)
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 28, height: 23)
                                                        Text("20°-25°")
                                                            .font(.system(size: 10))
                                                            .foregroundColor(Color("WordGray"))
                                                    }
                                                    .padding(2)
                                                    .cornerRadius(10)
                                                }
                                }.frame(width: 300,height: 57)
                            }
                            .frame(width: 340, height: 250)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("ItemStroke"), lineWidth: 1))
                            .padding(.top,30)
                            .padding(.bottom,5)
                            //推薦文章--------------------------------------------
                            HStack{
                                Text("推薦文章").font(.system(size: 20)).bold()
                                Spacer()
                                NavigationLink(destination: RideView(hideTab: $hideTab)){
                                label: do {
                                    Text("更多")
                                        .font(.system(size: 16)).bold()
                                        .cornerRadius(20)
                                        .foregroundColor(Color("Red"))
                                        }
                                    }
                            }.frame(width: 340).padding(.vertical,10)
                            ScrollView(.horizontal, showsIndicators: false){
                                VStack{
                                    VStack{
                                        Image("PassageImage")
                                            .resizable()
                                            .cornerRadius(10, corners: .topRight)
                                            .cornerRadius(10, corners: .topLeft)
                                    }.frame(width: 142, height: 93)
                                    VStack{
                                        Text("全台 5 大機車旅遊熱門路線【景點推薦】")
                                            .frame( height: 60)
                                            .font(.system(size: 14)).bold()
                                            .padding(6)
                                            .padding(.bottom,10)
                                    }.frame(height: 60)
                                }
                                .frame(width: 142, height: 160)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("ItemStroke"), lineWidth: 1))
                                .padding(.horizontal, 25)
                            }.padding(.bottom,5)
                            //推薦車友--------------------------------------------
                            HStack{
                                Text("您可能有興趣的車友").font(.system(size: 20)).bold()
                                Spacer()
                                NavigationLink(destination: TabButton()){
                                label: do {
                                    Text("更多")
                                        .font(.system(size: 16)).bold()
                                        .cornerRadius(20)
                                        .foregroundColor(Color("Red"))
                                        }
                                    }
                            }.frame(width: 340).padding(.vertical,10)
                            ScrollView(.horizontal, showsIndicators: false){
                                VStack(spacing: 5){
                                    Image("knightPhoto")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                    Text("王強生")
                                        .font(.system(size: 14)).bold()
                                    Text("曾與您出遊的車友")
                                        .font(.system(size: 10)).bold()
                                        .foregroundColor(Color("WordGray"))
                                    Button{
                                        //追蹤功能
                                    } label: {
                                        Text("+追蹤")
                                            .font(.system(size: 12)).bold()
                                            .foregroundColor(Color.white)
                                            .frame(width: 74, height: 24)
                                            .background(Color("Red"))
                                            .cornerRadius(10)
                                            .padding(8)
                                    }
                                }.padding(.top, 8)
                                .frame(width: 115, height: 160)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("ItemStroke"), lineWidth: 1))
                                .padding(.horizontal, 25)
                            }
                            
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .background(Color.white)
                        .cornerRadius(20, corners: UIRectCorner.topLeft)
                        .cornerRadius(20, corners: UIRectCorner.topRight)
                    }
                    .background(Color("Gray"))
                    .padding(.bottom,80)
                    .padding(.top,-10)
                }
            }
        }.onAppear {
            hideTab = false
                    }
    }
}

//struct RecommendRoot_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        RecommendRoot()
//    }
//}
