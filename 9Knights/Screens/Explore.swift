//
//  Explore.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct EventTileView: View {
    @FirestoreQuery(collectionPath: "areaTags") var tags: [Tag]
    var event: Event
    
    var body: some View {
        NavigationLink(destination: EventDetail(event: event)){
            ZStack{
                Rectangle()
                    .foregroundColor(Color("ItemShadow"))
                    .cornerRadius(10)
                    .frame(width: 175, height: 208)
                    .offset(y:4)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color("ItemStroke"), lineWidth: 1)
                    .background(.white)
                    .cornerRadius(10)
                    .frame(width: 180,height: 204)
                VStack(alignment: .leading){
                    //Event Image
                    AsyncImage(url: URL(string: event.photo)){ image in
                        image.resizable()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 166,height: 98)
                    //Event Tags
                    HStack{
                        ForEach(event.tags, id: \.self){ tags in
                            ZStack{
                                Capsule()
                                    .stroke(Color("ItemStroke"), lineWidth: 2)
                                    .background( Color("CreamyWhite"))
                                    .cornerRadius(20)
                                    .frame(width: 50, height: 16)
                                Text(tags)
                                    .foregroundColor(Color(.black))
                                    .bold()
                                    .font(.system(size: 10))
                            }
                        }
                    }
                    
                    //Event Date
                    Text("\(event.startDate.formatted(.dateTime.month().day()))")
                        .foregroundColor(Color("WordGray"))
                        .font(.system(size: 14, weight: .bold))
                        .padding(.bottom, 0.1)
                    //Event Name
                    Text(event.eventName)
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .bold))
                        .padding(.bottom,0.1)
                    //Event Host 待翻譯中文
                    Text("由 \(event.host) 創建")
                        .foregroundColor(Color("WordGray"))
                        .font(.system(size: 10, weight: .regular))

                }
            }
            .frame(width: 180, height: 200)
            .fixedSize()
            
        }

    }
}

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
                            .font(.system(size: 16))
                        Text("依活動日期排序")
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
                                Text("探索旅程").font(.system(size: 32)).bold().padding(.top,-8)
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
                                        NavigationLink(destination: Notifications()){
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
