//
//  Personal.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct Personal: View {
   
    struct RoundedCorner: Shape {

        var radius: CGFloat = .infinity
        var corners: UIRectCorner = .allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
    var body: some View {
        ZStack{
            
            VStack{
                
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
                    
                    VStack(alignment: .trailing){
                        Button{
                            
                        }label: {
                            ZStack{
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color("Gray"))
                                    .opacity(0.5)
                                Image(systemName: "gearshape.fill")
                                    .font(Font.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                    }.padding()
                }
                HStack{
                    Image("knightPhoto")
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .padding(.top, 25)
                    VStack{
                        HStack(alignment: .center){
                            Text("陳辰")
                                .font(.system(size: 24, weight: .bold))
                            Spacer()
                            Text("台北")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color("WordGray"))
                        }.padding(.bottom, 1)
                        HStack(alignment: .center){
                            Text("FZ6")
                                .font(.system(size: 16, weight: .bold))
                            Spacer()
                            Text("車主")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color("WordGray"))
                        }
                    }
                    .frame(width: 120)
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 0, trailing: 0))
                    Button{
                        
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .font(.system(size: 35))
                            .foregroundColor(Color("Red"))
                            .padding()
                    } .padding(.top, 30)
                    
                }.padding(.top, -15)
                HStack{
                    Spacer()
                    HStack{
                        Text("12")
                            .font(.system(size: 16, weight: .bold))
                        Text("粉絲")
                            .font(.system(size: 16, weight: .bold))
                    }
                    Spacer()
                    Divider()
                        .frame(width: 2)
                        .overlay(Color("ItemShadow"))
                    Spacer()
                    HStack{
                        Text("1")
                            .font(.system(size: 16, weight: .bold))
                        Text("追蹤中")
                            .font(.system(size: 16, weight: .bold))
                    }
                    Spacer()
                }.frame(height: 40)
                VStack{
                    Text("大家好!我叫陳辰，我熱愛騎機車。歡迎與我做朋友~")
                        .font(.system(size: 16))
                        .padding()
                }
                .frame(width: 346, height: 83)
                .background(Color("Gray"))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                .cornerRadius(20)
                .padding()
                VStack{
                    Divider()
                    Button{
                        //Button func
                    }label: {
                        HStack{
                            Text("我的貼文")
                                .foregroundColor(Color.black)
                                .bold()
                            Spacer()
                            Image(systemName: "arrowtriangle.forward.fill")
                                .foregroundColor(Color("Red"))
                        }
                    }
                    .padding(.horizontal, 30)
                    .frame(width: .infinity, height: 40)
                    Divider()
                    Button{
                        //Button func
                    }label: {
                        HStack{
                            Text("曾參與的旅程")
                                .foregroundColor(Color.black)
                                .bold()
                            Spacer()
                            Image(systemName: "arrowtriangle.forward.fill")
                                .foregroundColor(Color("Red"))
                        }
                    }
                    .padding(.horizontal, 30)
                    .frame(width: .infinity, height: 35)
                    Divider()
                    Button{
                        
                    }label: {
                        HStack{
                            Text("我創建的旅程")
                                .foregroundColor(Color.black)
                                .bold()
                            Spacer()
                            Image(systemName: "arrowtriangle.forward.fill")
                                .foregroundColor(Color("Red"))
                        }
                    }
                    .padding(.horizontal, 30)
                    .frame(width: .infinity, height: 40)
                    Divider()
                }
                Spacer()
            }
           
            
        }
    }
}

struct Personal_Previews: PreviewProvider {
    static var previews: some View {
        Personal()
    }
}
