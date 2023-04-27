//
//  AttendEvent.swift
//  9Knights
//
//  Created by Peggy on 2023/4/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
struct AttendEventNavigationBar: View {
    
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
            ZStack {
                HStack{
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
                }
                HStack{
                    Spacer()
                    Text("參與旅程").font(.system(size: 24)).bold()
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 44)
    }
}
struct AttendEvent: View {
    
    @FirestoreQuery(collectionPath: "events") var events: [Event]
    @FirestoreQuery(collectionPath: "areaTags") var tags: [Tag]
    
    @State private var selectedIndex = 0
     let titles = ["我創建的旅程", "曾參與的旅程"]

    @State private var selectedSegment = 0
    @State private var selectedTab = 0
    @Environment(\.presentationMode) var presentationMode
    
   var body: some View {
       VStack {
           AttendEventNavigationBar()
           TwoTabSegmentedControl(selectedIndex: $selectedIndex, titles: titles)
           if selectedIndex == 0 {
               //我創建的旅程--------------------------------------------------------------------
               let twoItemGrid = [GridItem(.flexible(),spacing: -10), GridItem(.flexible(),spacing: 0)]
               LazyVStack( spacing: 15) {
                   ForEach(events) { event in
                       AttendEventTileView(event: event)
                   }
               }
               Spacer()
           }else{
               //曾參與的旅程--------------------------------------------------------------------
               VStack {
                   Spacer()
                   ZStack{
                       Circle().frame(width: 190).foregroundColor(Color("Gray"))
                       Image("NothingHere")
                           .padding(.bottom, 10)
                   }
                   Text("尚無參加的旅程")
                       .font(.system(size: 20, weight: .bold))
                       .foregroundColor(Color("WordGray"))
                       .padding(.bottom,100)
                   Spacer()
               }
               Spacer()
           }
           
       }
       .navigationBarHidden(true)
   }
}

struct AttendEvent_Previews: PreviewProvider {
    static var previews: some View {
        AttendEvent()
    }
}
