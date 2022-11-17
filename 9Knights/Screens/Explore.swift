//
//  Explore.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/12.
//

import SwiftUI
import Firebase

struct Explore: View {
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: threeColumnGrid) {
                
            }
        }
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
