//
//  CustomAlertButton.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/5/2.
//

import SwiftUI

struct CustomAlertButton: View {

    // MARK: - Value
    // MARK: Public
    let title: LocalizedStringKey
    var action: (() -> Void)? = nil
    
    
    // MARK: - View
    // MARK: Public
    var body: some View {
        Button {
          action?()
        
        } label: {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
        }
        .frame(height: 30)
        .background(Color.purple)
        .cornerRadius(15)
    }
}
