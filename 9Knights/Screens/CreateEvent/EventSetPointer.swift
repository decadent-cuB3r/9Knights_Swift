//
//  EventSetPointer.swift
//  9Knights
//
//  Created by Peggy on 2023/5/9.
//

import Foundation
import SwiftUI
import MapKit

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

struct EventSetPointer: View {
    let coordinate = CLLocationCoordinate2D(latitude: 25.033671, longitude: 121.564427)
    @State var offset : CGFloat = -200

    var body: some View {
        NavigationStack{
            
            ZStack{
                
                RouteMapView(coordinate: coordinate)
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

