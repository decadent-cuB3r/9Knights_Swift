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
    @FirestoreQuery(collectionPath: "tags") var tags: [Tag]
    var event: Event
    
    var body: some View {
        NavigationLink(destination: Text("second View")){
            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(.white)
                    .shadow(radius: 5.0)
                VStack(alignment: .leading){
                    //Event Image
                    AsyncImage(url: URL(string: event.photo)){ image in
                        image.resizable()
                            .cornerRadius(10)
                            .padding(2.0)
                    } placeholder: {
                        ProgressView()
                    }
                    //Event Tags
                    
                    
                    //Event Date
                    Text("\(event.startDate.formatted(.dateTime.month().day()))")
                        .foregroundColor(Color("WordGray"))
                    //Event Name
                    Text(event.eventName)
                        .foregroundColor(.black)
                    //Event Host 待翻譯中文
                    Text("由 \(event.host) 創建")

                }
            }.frame(width: 200, height: 200).fixedSize()
        }

    }
}

struct Explore: View {
    
    @FirestoreQuery(collectionPath: "events") var events: [Event]
    @FirestoreQuery(collectionPath: "areaTags") var tags: [Tag]
    
    @State var selectedTag = "All"
    
    var body: some View {
        NavigationStack{
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        Spacer(minLength: 25)
                        Button {
                            self.selectedTag = "All"
                        } label: {
                            ZStack{
                                Capsule()
                                    .stroke(Color("ItemStroke"), lineWidth: 1)
                                    .background(
                                        selectedTag == "All" ? Color("Red") : Color("CreamyWhite")
                                    )
                                    .cornerRadius(20)
                                    .frame(width: 100, height: 40)
                                    .shadow(radius: 1.0)
                                Text("全部")
                                    .foregroundColor(selectedTag == "All" ? Color(.white) : Color(.black))
                                    .bold()
                            }

                        }.buttonStyle(StaticButtonStyle())
                        ForEach(tags){tag in
                            Spacer(minLength: 25)
                            Button {
                                self.selectedTag = tag.tagID
                                print(tag.tagID)
                            } label: {
                                ZStack{
                                    Capsule()
                                        .stroke(Color("ItemStroke"), lineWidth: 1)
                                        .background(
                                            selectedTag == tag.tagID ? Color("Red") : Color("CreamyWhite")
                                        )
                                        .cornerRadius(20)
                                        .frame(width: 100, height: 40)
                                        .shadow(radius: 2.0)
                                    Text(tag.tagName)
                                        .foregroundColor(selectedTag == tag.tagID ? Color(.white) : Color(.black))
                                        .bold()
                                }
                                
                            }.buttonStyle(StaticButtonStyle())
                        }
                    }.frame(height: 60)
                }
                
                let twoItemGrid = [GridItem(.flexible()), GridItem(.flexible())]
                LazyVGrid(columns: twoItemGrid) {
                    ForEach(events) { event in
                        EventTileView(event: event)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarItems(leading:
                                //This is your made up title, put in the leading view so it is up top aligned with the plus button
                                Text("探索旅程").font(.system(size: 32)).bold()
                                //This is the plus button, on the right side, aka trailing view
                                , trailing: Button(action: {

                                }, label: {
                                    HStack{
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
                                        Button{
                                            
                                        } label: {
                                            ZStack{
                                                Circle()
                                                    .frame(width: 40, height: 40)
                                                    .foregroundColor(Color("Gray"))
                                                Image(systemName: "magnifyingglass")
                                                    .font(Font.system(size: 16, weight: .semibold))
                                                    .foregroundColor(Color("BtnGray"))
                                            }
                                        }
                                    }
                                })
                        )
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
