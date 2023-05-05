//
//  CustomNavigationBar.swift
//  9Knights
//
//  Created by Peggy on 2023/4/25.
//

import Foundation
import SwiftUI
struct CustomBar: View {
    var text: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .ignoresSafeArea()
                .shadow(color: Color.gray.opacity(0.05), radius: 4, x: 0, y: 4)
                .frame(width: 390,height: 70)
            ZStack {
                HStack{
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        ZStack{
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color("Gray"))
                                .opacity(0.5)
                            Image("BlackArrowLeft")
                                .font(Font.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text(text).font(.system(size: 24)).bold()
                    Spacer()
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 70)
    }
}
