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
        ScrollView{
            VStack{
                ZStack{
                    ZStack(alignment: .topTrailing){
                        Rectangle()
                            .foregroundColor(Color("ItemShadow"))
                            .frame(width: 385, height: 222)
                            .cornerRadius(20,corners: [.bottomLeft, .bottomRight])
                            .padding(.trailing,2)
                        Rectangle()
                            .foregroundColor(Color("WordGray"))
                            .frame(width: 390, height: 212)
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
                    ForEach(event.tags, id: \.self){ tags2 in
                        Button{
                            
                        }label: {
                            ZStack{
                                Capsule()
                                    .stroke(Color("ItemStroke"), lineWidth: 2)
                                    .background( Color("CreamyWhite"))
                                    .cornerRadius(20)
                                    .frame(width: 80, height: 30)
                                Text(tags2)
                                    .foregroundColor(Color(.black))
                                    .bold()
                            }
                        }
                    }
                    Spacer()
                }.padding()
                
            }
            
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
