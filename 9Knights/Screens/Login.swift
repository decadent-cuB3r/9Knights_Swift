//
//  Login.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/16.
//

import SwiftUI

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    
    let SystemGray = Color(red: 0.925, green: 0.925, blue: 0.925)
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(SystemGray)
                .offset(x: 180, y: -180)
                .frame(width: 500, height: 500)
            Circle()
                .foregroundColor(SystemGray)
                .offset(x: -180, y: 180)
            VStack{
                
                Text("9Knights")
                TextField("電子信箱", text: $email)
                    .frame(width: 300, height: 50)
                    .foregroundColor(SystemGray)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(SystemGray)
                        .cornerRadius(10)
                        .border(.black)
                    )
                TextField("密碼", text: $password)
                    .frame(width: 300, height: 50)
                    .foregroundColor(SystemGray)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(SystemGray)
                        .cornerRadius(10)
                        .border(.black)
                    )
                HStack{
                    
                }
                
                
            }
        }.ignoresSafeArea().fixedSize()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
