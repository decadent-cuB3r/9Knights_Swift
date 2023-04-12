//
//  Notifications.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/27.
//

import SwiftUI
import MapKit

struct RideView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.025237122289447, longitude: 121.54045285890733), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true)
            .ignoresSafeArea()
    }
}

struct RideView_Previews: PreviewProvider {
    static var previews: some View {
        RideView()
    }
}
