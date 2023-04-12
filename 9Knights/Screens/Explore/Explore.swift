//
//  Explore.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Explore: View {
    @State private var isPresented = false
    @FirestoreQuery(collectionPath: "events") var events: [Event]
    @FirestoreQuery(collectionPath: "areaTags") var tags: [Tag]
    
    @State var selectedTag = "All"
    
    var body: some View {
        NavigationView{
            ScrollView {
                //tag Selection section
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        Spacer(minLength: 10)
                        ZStack{
                            Button {
                                self.selectedTag = "All"
                            } label: {
                                ZStack{
                                    Capsule()
                                        .foregroundColor(Color("ItemShadow"))
                                        .cornerRadius(20)
                                        .frame(width: 87, height: 30)
                                        .offset(y:4)
                                    Capsule()
                                        .stroke(Color("ItemStroke"), lineWidth: 2)
                                        .background(
                                            selectedTag == "All" ? Color("Red") : Color("CreamyWhite")
                                        )
                                        .cornerRadius(20)
                                        .frame(width: 90, height: 30)
                                    Text("全部")
                                        .foregroundColor(selectedTag == "All" ? Color(.white) : Color(.black))
                                        .bold()
                                    
                                }.frame(width: 90, height: 50)

                            }.buttonStyle(StaticButtonStyle())
                        }
                        
                        ForEach(tags){tag in
                            Spacer(minLength: 20)
                            Button {
                                self.selectedTag = tag.tagID
                                print(tag.tagID)
                            } label: {
                                ZStack{
                                    Capsule()
                                        .foregroundColor(Color("ItemShadow"))
                                        .cornerRadius(20)
                                        .frame(width: 87, height: 30)
                                        .offset(y: 4)
                                    Capsule()
                                        .stroke(Color("ItemStroke"), lineWidth: 2)
                                        .background(
                                            selectedTag == tag.tagID ? Color("Red") : Color("CreamyWhite")
                                        )
                                        .cornerRadius(20)
                                        .frame(width: 90, height: 30)
                                    Text(tag.tagName)
                                        .foregroundColor(selectedTag == tag.tagID ? Color(.white) : Color(.black))
                                        .bold()
                                }
                                
                            }.buttonStyle(StaticButtonStyle())
                        }
                    }.frame(height: 50)
                }
                Button{
                    
                }label: {
                    HStack{
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size: 14))
                        Text("依活動日期排序(最近)")
                        Spacer()
                    }
                    .foregroundColor(Color("WordGray"))
                    .padding(.leading,20)
                }
                //Grid show Event View Tiles
                let twoItemGrid = [GridItem(.flexible(),spacing: -10), GridItem(.flexible(),spacing: 0)]
                LazyVGrid(columns: twoItemGrid,spacing: 20) {
                    ForEach(events) { event in
                        EventTileView(event: event)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                Text("探索").font(.system(size: 32)).bold().padding(.top,-8)
                                , trailing:
                                    HStack{
                                        Button{
                                            self.isPresented.toggle()
                                        } label: {
                                            ZStack{
                                                Circle()
                                                    .frame(width: 40, height: 40)
                                                    .foregroundColor(Color("Gray"))
                                                Image(systemName: "magnifyingglass")
                                                    .font(Font.system(size: 16, weight: .semibold))
                                                    .foregroundColor(Color("BtnGray"))
                                            }
                                        }.fullScreenCover(isPresented: $isPresented, content: ExploreSearch.init)
                                        NavigationLink(destination: RideView()){
                                            Button{
                                                
                                            } label: {
                                                ZStack{
                                                    Circle()
                                                        .frame(width: 40, height: 40)
                                                        .foregroundColor(Color("Gray"))
                                                    Image(systemName: "bell")
                                                        .font(Font.system(size: 16, weight: .semibold))
                                                        .foregroundColor(Color("BtnGray"))
                                                }
                                            }
                                        }
                                }.padding(.top,-8)
                        )
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
