//
//  StandardHeader.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/11.
//

import SwiftUI

struct StandardHeader: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(20)
            .font(.system(size: 32,
                          weight: .bold))
    }
}

struct StandardHeader_Previews: PreviewProvider {
    static var previews: some View {
        StandardHeader(text: "Test")
    }
}
