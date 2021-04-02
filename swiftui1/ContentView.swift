//
//  ContentView.swift
//  swiftui1
//
//  Created by 永見清文 on 2020/11/30.
//

import SwiftUI
import MapKit
import CoreLocation
struct ContentView: View {
    @ObservedObject var locationObserver = LocationObserver()
    var body: some View {
        VStack {
            MapView(coordinate: self.locationObserver.location.coordinate)
                .frame(height: 300)
            CircleImage(localImage: self.locationObserver.localImage)
                .offset(y: 30)
                .padding(.bottom, 30)
                .padding(.leading, 100)

            VStack(alignment: .leading) {
                Text(self.locationObserver.locality)
                    .font(.title)
                HStack(alignment: .top) {
                    Text(self.locationObserver.administrativeArea)
                        .font(.subheadline)
                    Spacer()
                    Text(self.locationObserver.country)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
