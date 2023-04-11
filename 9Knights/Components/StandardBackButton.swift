//
//  StandardBackButton.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/11.
//

import SwiftUI

struct StandardBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image("whiteArrow")
                .foregroundColor(.black)
        }
        .frame(width: 50, height: 50)
        .background(Color("Gray"))
        .cornerRadius(50)
        
    }
}

struct StandardBackButton_Previews: PreviewProvider {
    static var previews: some View {
        StandardBackButton()
    }
}
