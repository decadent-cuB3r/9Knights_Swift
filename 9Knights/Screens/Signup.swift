//
//  Signup.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/22.
//

import SwiftUI

struct Signup: View {
    var body: some View {
        ZStack{
            VStack{
                Text("註冊新帳號")
                    .font(.largeTitle)
            }.padding(.top, 20)
        }.background(Color("FAF3EA"))
    }
}
struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}

