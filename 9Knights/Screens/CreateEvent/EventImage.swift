//
//  CreateEvent.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/10.
//

import SwiftUI

struct EventImage: View {
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    StandardBackButton()
                    StandardHeader(text: "旅程封面")
                    
                }
            }
            Divider()
            
            
        }
    }
}

struct EventImage_Previews: PreviewProvider {
    static var previews: some View {
        EventImage()
    }
}
