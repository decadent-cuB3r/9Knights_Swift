//
//  SplashView.swift
//  9Knights
//
//  Created by decadent cub3r on 2022/11/22.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActived = false
    @State private var size = 0.6
    @State private var opacity = 0.5
    
    var body: some View {
        if isActived {
            ContentView()
        }else{
            VStack{
                VStack{
                    Image("logoImage")
                    Image("logoWord")
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 0.8)){
                        self.size = 0.8
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    isActived = true
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
