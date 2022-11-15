//
//  ContentView.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/10.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var selectedIndex = 0
    
    let icons = [
        "house",
        "map",
        "plus",
        "message",
        "person.circle"
    ]
    
    let tabWords = [
        "探索",
        "地圖",
        "",
        "交流",
        "個人"
    ]
    
    struct Triangle : Shape {
        
        func path(in rect: CGRect) -> Path {
            var path = Path()

            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            

            return path
        }
    }
    
    
    var body: some View {
        VStack{
            ZStack{
                switch selectedIndex {
                case 0 :
                    NavigationView{
                        VStack{
                            Text("First Screen")
                        }
                        .navigationTitle("Home")
                    }
                case 1 :
                    NavigationView{
                        VStack{
                            Text("First Screen")
                        }
                        .navigationTitle("Map")
                    }
                case 2 :
                    NavigationView{
                        VStack{
                            Text("First Screen")
                        }
                        .navigationTitle("Plus")
                    }
                case 3 :
                    NavigationView{
                        VStack{
                            Text("First Screen")
                        }
                        .navigationTitle("Communication")
                    }
                default:
                    NavigationView{
                        VStack{
                            Text("Second Screen")
                        }
                        .navigationTitle("Person")
                    }
                }
            }
            ZStack{
                HStack{
                    ForEach(0..<5, id: \.self ){ number in
                        Spacer()
                        Button( action: {
                            self.selectedIndex = number
                        }, label: {
                            if number == 2{
                                VStack{
                                   Image(systemName: icons[number])
                                       .font(.system(size: 25,
                                                     weight: .regular,
                                                     design: .default))
                                       .foregroundColor( .white )
                                       .frame(width: 50, height: 50)
                                       .padding(-2)
                                }.cornerRadius(10)
                            }else{
                                VStack{
                                   Image(systemName: icons[number])
                                       .font(.system(size: 25,
                                                     weight: .regular,
                                                     design: .default))
                                       .foregroundColor( selectedIndex == number ? Color(red: 0.8549, green: 0.3098, blue: 0.251, opacity: 1) : Color(UIColor.lightGray))
                                   Text(tabWords[number])
                                       .font(.system(size: 10))
                                       .padding(1)
                                       .foregroundColor(selectedIndex == number ? Color(red: 0.8549, green: 0.3098, blue: 0.251, opacity: 1) : Color(UIColor.lightGray))
                               }
                            }
                            
                        })
                        Spacer()
                    }
                    .frame(height: 90)
                    .padding(.bottom, 10)
                }
                .background(.white)
                .cornerRadius(30)
                .shadow(color: Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 1) ,radius: 5)
                
                    Button( action: {
                    }, label: {
                            VStack{
                                Image(systemName: icons[2])
                                    .font(.system(size: 35,
                                                  weight: .regular,
                                                  design: .default))
                                    .foregroundColor( .white )
                                    .frame(width: 70, height: 60)
                                    .background( Color(red: 0.8549, green: 0.3098, blue: 0.251, opacity: 1 ))
                                    .padding(.bottom,-8)
                                Triangle()
                                    .frame(width: 70, height: 30)
                                    .padding(0)
                                    .foregroundColor( Color(red: 0.8549, green: 0.3098, blue: 0.251, opacity: 1 ))
                            }
                            .cornerRadius(5)
                            .frame(width: 0, height: 0)
                    }
                    )
                    .padding(.bottom, 40)
                }
            }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
