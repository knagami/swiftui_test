//
//  MapView.swift
//  swiftui1
//
//  Created by 永見清文 on 2020/11/30.
//

import SwiftUI
import MapKit
import CoreLocation
struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    func makeUIView(context: Context) -> MKMapView {
           MKMapView(frame: .zero)
       }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //let coordinate = CLLocationCoordinate2D(
        //    latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2DMake(35.682117, 139.774669))
    }
}
