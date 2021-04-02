//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by 永見清文 on 2021/03/30.
//

import SwiftUI

import MapKit
import CoreLocation
struct ContentView: View {
    @ObservedObject var locationObserver = LocationObserver()
    var body: some View {
        VStack(alignment: .leading) {
            Text("現在地")
            VStack(alignment: .center) {
                CircleImage(localImage: self.locationObserver.localImage)
                    .padding(.top,20)
                    .padding(.leading,40)
                Text(self.locationObserver.locality)
                    .padding(.bottom,-20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
