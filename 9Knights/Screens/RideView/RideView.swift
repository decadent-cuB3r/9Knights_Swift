//
//  Notifications.swift
//  9Knights
//
//  Created by Ezra Yichen YU on 2022/11/27.
//

import SwiftUI
import MapKit

struct RideView: View {
    @State var informationShow: Bool = true
    @StateObject private var viewModel = UserLocationViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            ZStack{
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    .ignoresSafeArea()
                    .onAppear{
                        viewModel.checkIfLocationServicesIsEnabled()
                    }
                    .sheet(isPresented: $informationShow){
                        RideInformation()
                    }
                VStack{
                    HStack{
                        Button(action: {dismiss()} ){
                            Image(systemName: "escape")
                        }
                        NavigationLink(destination: Setting()){
                            ZStack{
                                Circle()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color("Gray"))
                                    .opacity(0.5)
                                Image(systemName: "gearshape.fill")
                                    .font(Font.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct RideInformation: View {
    var body: some View {
        Text("test")
    }
}

struct RideView_Previews: PreviewProvider {
    static var previews: some View {
        RideView()
    }
}
