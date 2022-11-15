//
//  ContentView.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/10.
//

import SwiftUI

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
            
            HStack{
                ForEach(0..<5, id: \.self ){ number in
                    Spacer()
                    Button( action: {
                        self.selectedIndex = number
                    }, label: {
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
                        
                    })
                    Spacer()
                }
                .frame(height: 80)
                .padding(.bottom, 20)
            }
            .background(.white)
            .cornerRadius(30)
            .shadow(color: Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 1) ,radius: 5)
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
