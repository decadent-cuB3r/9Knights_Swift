//
//  RideInfo.swift
//  9Knights
//
//  Created by Peggy on 2023/5/9.
//
import Foundation
import SwiftUI
struct RideInfo: View {
    @State private var hideTab = false
    @State private var MapisOn = false
    @State private var BetteryisOn = false
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    CustomBar(text: "行程資訊")
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            hideTab = true
        }
        .onDisappear {
            hideTab = false
        }
    }
}

struct RideInfo_Previews: PreviewProvider {
    static var previews: some View {
        RideInfo()
    }
}
