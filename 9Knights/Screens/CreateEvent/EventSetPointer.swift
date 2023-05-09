//
//  EventSetPointer.swift
//  9Knights
//
//  Created by Peggy on 2023/5/9.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct EventSetPointerNavigationBar: View {
    @State private var isPresented = false
    @State private var isPresentedright = false
    @State private var searchText = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    ZStack{
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("Red"))
                        Image("whiteArrow")
                            .font(Font.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                VStack {
                    TextField("輸入關鍵字搜尋", text: $searchText)
                        .padding()
                }.frame(width: 290, height: 45)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
            }
            .padding(.horizontal, 16)
        }
        .padding(.top,40)
        .frame(height: 44)
        .background(Color.clear)
    }
}

struct PointerMapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @State var locationManager = CLLocationManager()
    var initialCoordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        locationManager.requestWhenInUseAuthorization()
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        if CLLocationCoordinate2DIsValid(centerCoordinate) {
            let region = MKCoordinateRegion(center: centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
            view.setRegion(region, animated: true)
        } else {
            centerCoordinate = initialCoordinate
            let region = MKCoordinateRegion(center: centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
            view.setRegion(region, animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: PointerMapView

        init(_ parent: PointerMapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            parent.centerCoordinate = mapView.centerCoordinate
        }

        func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
            let center = mapView.centerCoordinate
            parent.centerCoordinate = center
        }

        func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
            print(error.localizedDescription)
        }
    }

    func getCenterCoordinate() -> CLLocationCoordinate2D {
        return centerCoordinate
    }
}

struct EventSetPointer: View {
    let initialCoordinate = CLLocationCoordinate2D(latitude: 25.008902, longitude: 121.539842)
    @State var offset : CGFloat = -200
    @State private var centerCoordinate = CLLocationCoordinate2D(latitude: 25.008902, longitude: 121.539842)
    var body: some View {
        NavigationStack{
            
            ZStack{
                GeometryReader { geo in
                            ZStack {
                                PointerMapView(centerCoordinate: $centerCoordinate, initialCoordinate: initialCoordinate)
                                    .frame(width: geo.size.width, height: geo.size.height)
                                Image("Point")
                                VStack(spacing: 10){
                                    HStack{
                                        Spacer()
                                        Button{
                                            
                                        }label: {
                                            Text("確認")
                                                .font(Font.system(size: 12)).bold()
                                                .frame(width: 66, height: 23)
                                                .background(Color("Red"))
                                                .foregroundColor(Color.white)
                                                .cornerRadius(20)
                                        }
                                    }.padding(.trailing)
                                    HStack{
                                        VStack(alignment: .leading, spacing: 10){
                                            Text("經度: \(centerCoordinate.latitude)")
                                                .font(Font.system(size: 16))
                                            Text("緯度: \(centerCoordinate.longitude)")
                                                .font(Font.system(size: 16))
                                        }
                                       Spacer()
                                    }.frame(width: 320)
                                }
                                .frame(width: 360, height: 120)
                                .background(Color.white)
                                .cornerRadius(20)
                                .padding(.top,590)
                                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 0)
                            }
                        }
                GeometryReader { geometry in
                    EventSetPointerNavigationBar()
                    
                }
                .ignoresSafeArea(.all, edges: .bottom)
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}


struct EventSetPointer_Previews: PreviewProvider {
    static var previews: some View {
        EventSetPointer()
    }
}

