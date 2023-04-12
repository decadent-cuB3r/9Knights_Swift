//
//  UserLocationViewModel.swift
//  9Knights
//
//  Created by decadent cub3r on 2023/4/12.
//

import SwiftUI
import MapKit

final class UserLocationViewModel: ObservableObject {
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Alert user to turn on location services.")
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location services are resticted likely due to parental settings.")
        case .denied:
            print("You have denied on this app before. Go into settings and turn this on.")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
}
