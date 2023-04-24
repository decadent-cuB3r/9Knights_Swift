//
//  TwoTabSegmentedControl.swift
//  9Knights
//
//  Created by Peggy on 2023/4/25.
//

import Foundation
import SwiftUI
struct TwoTabSegmentedControl: View {
    @State var isAnimating = false
    @Binding var selectedIndex: Int
    var titles: [String]
    
    
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                ForEach(0..<2) { index in
                    Button(action: {
                        selectedIndex = index
                        withAnimation(.spring()) {
                                        isAnimating.toggle()
                                    }
                    }, label: {
                        ZStack {
                            Text(titles[index])
                                .font(.system(size: 16)).bold()
                                .foregroundColor(selectedIndex == index ? .black : Color("WordGray"))
                                .animation(.spring())
                                .background(Color("Gray"))
                            if selectedIndex == index {
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(Color("Red"))
                                    .padding(.top,45)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    })
                    .buttonStyle(StaticButtonStyle())
                    .animation(.easeInOut, value: isAnimating)
                }
            } .frame(width: 390, height: 46)
            .background(Color("Gray"))
               
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white)
        }
    }
}
