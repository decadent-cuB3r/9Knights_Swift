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

struct ProgressBar: View {
    var progress: Double = 150
    var total: Double = 300

    var body: some View {
        VStack(alignment: .leading) {
            ProgressView(value: progress, total: total)
            .frame(width: 238,height: 8.0)
            .accentColor(Color("Red"))
            .scaleEffect(x: 1, y:2, anchor: .center)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            HStack(spacing: 2){
                Text("\(Int(progress))/\(Int(total))").font(.system(size: 12))
                Image(systemName: "star.fill")
                    .foregroundColor(Color("Red"))
                    .font(.system(size: 10))
            }
        }
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
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Binding var hideTab: Bool

    var body: some View {
        NavigationStack{
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
                            NavigationLink(destination: Setting(hideTab: $hideTab).environmentObject(viewModel)){
                                ZStack{
                                    Circle()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color("Gray"))
                                        .opacity(0.5)
                                    Image(systemName: "gearshape.fill")
                                        .font(Font.system(size: 20, weight: .semibold))
                                        .foregroundColor(.white)
                                }
                            }.padding()
                        }
                    }
                    HStack(spacing: 15){
                        Image("knightPhoto")
                            .resizable()
                            .frame(width: 76, height: 76)
                            .clipShape(Circle())
                            .padding(.top, 25)
                        VStack(alignment:.leading){
                            HStack(alignment: .bottom){
                                Text(viewModel.userName)
                                    .font(.system(size: 24, weight: .bold))
                                Spacer()
                                Text("24")
                                    .font(.system(size: 16, weight: .bold))
                                Text("台北")
                                    .font(.system(size: 16, weight: .bold))
                            }.padding(.bottom, 1)
                            HStack{
                                HStack{
                                    Text("12")
                                        .font(.system(size: 14, weight: .bold))
                                    Text("粉絲")
                                        .font(.system(size: 14, weight: .bold))
                                }
                                Spacer()
                                Divider()
                                    .frame(width: 1,height: 25)
                                    .overlay(Color("ItemShadow"))
                                Spacer()
                                HStack{
                                    Text("1")
                                        .font(.system(size: 14, weight: .bold))
                                    Text("追蹤中")
                                        .font(.system(size: 14, weight: .bold))
                                }
                            }.frame(width:140, height: 40)
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
                    HStack(spacing: 30){
                        NavigationLink(destination: MyPost(hideTab: $hideTab)){
                            VStack(spacing: 5){
                                Text("發布貼文").bold().font(.system(size: 12))
                                Text("0").bold().font(.system(size: 24))
                            }.frame(width: 80, height: 70)
                            .background(Color("Gray"))
                            .cornerRadius(10)
                            .foregroundColor(.black)
                        }
                        NavigationLink(destination: AttendEvent(hideTab: $hideTab)){
                            VStack(spacing: 5){
                                Text("參與旅程").bold().font(.system(size: 12))
                                Text("0").bold().font(.system(size: 24))
                            }.frame(width: 80, height: 70)
                            .background(Color("Gray"))
                            .cornerRadius(10)
                            .foregroundColor(.black)
                        }
                        NavigationLink(destination: FriendReview(hideTab: $hideTab)){
                            VStack(spacing: 5){
                                Text("車友評價").bold().font(.system(size: 12))
                                Text("0").bold().font(.system(size: 24))
                            }.frame(width: 80, height: 70)
                            .background(Color("Gray"))
                            .cornerRadius(10)
                            .foregroundColor(.black)
                        }
                    }.padding(.vertical)
                    HStack{
                        Image("Bronze").padding()
                        VStack(alignment: .leading){
                            Text("Lv.1 見習騎士").bold().font(.system(size: 16))
                            ProgressBar()
                            HStack{
                                Spacer()
                                NavigationLink(destination: LevelRules(hideTab: $hideTab)){
                                    VStack(spacing: 5){
                                        Text("查看等級與規則")
                                            .bold().font(.system(size: 10))
                                            .foregroundColor(Color("WordGray"))
                                    }.frame(width: 87, height: 23)
                                    .background(Color("Gray"))
                                    .cornerRadius(5)
                                    .padding(.horizontal)
                                    .padding(.vertical,-10)
                                }
                            }
                        }
                    }.frame(width: 346, height: 120)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("ItemStroke"), lineWidth: 1))
                    VStack(alignment: .leading, spacing: 10){
                        Text("個人簡介").font(.system(size: 16)).bold()
                        Text("大家好!我叫陳辰，我熱愛騎機車。歡迎與我做朋友~\n快來加我好友八托尼><")
                            .font(.system(size: 14))
                            .lineSpacing(5)
                            .foregroundColor(Color("WordGray"))
                    }
                    .frame(width: 346)
                    .padding(.vertical,10)
                    Spacer()
                }
                
                
            }
        }.onAppear {
            hideTab = false
        }
    }
}

struct Personal_Previews: PreviewProvider {
    @State static private var hideTab = false

    static var previews: some View {
        Personal(hideTab: $hideTab).environmentObject(AuthenticationViewModel())
    }
}
