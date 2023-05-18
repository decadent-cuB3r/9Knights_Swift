//
//  EventRoute.swift
//  9Knights
//
//  Created by Peggy on 2023/5/8.
//

import Foundation
import SwiftUI
import MapKit

struct RouteMapView: UIViewRepresentable {

    var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
    }
}
struct EventRouteNavigationBar: View {
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
                Text("設置中途點").font(.system(size: 20)).bold()
                Spacer()
                NavigationLink(destination: EventDetails()){ Text("完成").foregroundColor(Color("Red")).font(.system(size: 18)).bold() }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
    }
}

struct EventRoute: View {
    let coordinate = CLLocationCoordinate2D(latitude: 25.0255049, longitude: 121.5373224)
    @State var offset : CGFloat = -200

    var body: some View {
        NavigationStack{
            EventRouteNavigationBar()
            ZStack{
                RouteMapView(coordinate: coordinate)
                GeometryReader { geometry in
                    
                    VStack {
                        ButtomSheet()
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
                                            offset = (-geometry.frame(in: .global).height + 150)
                                            
                                            return
                                        }
                                        offset = 0
                                    }
                                    if value.startLocation.y > geometry.frame(in: .global).midX{
                                        
                                        if value.translation.height < geometry.frame(in: .global).midX{
                                            offset = (-geometry.frame(in: .global).height + 150)
                                            
                                            return
                                        }
                                        offset = 0
                                    }
                                }
                                
                            }))
                    }
                    
                }
                .ignoresSafeArea(.all, edges: .bottom)
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}
struct ButtomSheet: View {
    @State private var selectedTime = Date()
    @State private var select: Int = 0
    private var items = ["Day 1"]
    
    private let timeFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
    }()
    
    var body: some View {
        VStack {
           Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 50,height: 5)
                .padding(.top)
                .padding(.bottom,5)
            ScrollView(.vertical, showsIndicators: false){
                ZStack{
                    SegmentedControl(items: items, selection: $select)
                    Button{
                        
                    }label: {
                        Spacer()
                        Image("Add")
                            .padding(.horizontal)
                    }
                }
                HStack{
                    Text("出發時間:").font(.system(size: 16, weight: .bold))
                    DatePicker(
                        " ",
                        selection: $selectedTime,
                        displayedComponents: [.hourAndMinute]
                    ).padding(.trailing,200)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                }.padding(.leading)
                HStack{
                    ZStack{
                        Image("Point")
                        Text("1").foregroundColor(Color("Red")).font(.system(size: 10).bold()).padding(.bottom,8)
                    }
                    Spacer()
                    HStack{
                        VStack(alignment: .leading, spacing: 8){
                            Text("STARBUCKS 星巴克 (建和門市)").font(.system(size: 16, weight: .bold))
                            Text("106台北市大安區和平東路二段42-1號").font(.system(size: 14))
                        }.padding()
                        Spacer()
                    }
                    .frame(width: 332, height: 80)
                    .background(Color("Gray"))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }.frame(maxWidth: 366)
                NavigationLink(destination: EventSetPointer()){
                    Image("Add")
                        .frame(width: 40, height: 40)
                        .background(Color("Gray"))
                        .cornerRadius(20)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 1)
                        )
                }.padding()
            }
            .padding(.top)
        }.background(Color.white).cornerRadius(15)
    }
}


struct EventRoute_Previews: PreviewProvider {
    static var previews: some View {
        EventRoute()
    }
}

