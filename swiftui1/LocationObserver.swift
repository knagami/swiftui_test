//
//  LocationObserver.swift
//  swiftui1
//
//  Created by 永見清文 on 2020/12/28.
//

import Foundation
import CoreLocation
import Combine

class LocationObserver: NSObject, ObservableObject, CLLocationManagerDelegate {
  @Published private(set) var location = CLLocation()
  @Published private(set) var country = ""
  @Published private(set) var administrativeArea = ""
  @Published private(set) var locality = ""
  @Published private(set) var localImage = ""
  private let locationManager: CLLocationManager
  private let geocoder = CLGeocoder()
  override init() {
    self.locationManager = CLLocationManager()
    
    super.init()
    
    self.locationManager.delegate = self
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
  }
  
  func locationManager(_: CLLocationManager, didUpdateLocations: [CLLocation]) {
    location = didUpdateLocations.last!
    
    print(location.coordinate)
    
    #if os(watchOS)
    if(location.coordinate.latitude==34.69139){
        
        self.localImage="kobe"
        self.locality = "神戸市中央区"
    }else{
        self.localImage="turtlerock"
        self.locality = "クパチィーノ"
    }
    #endif
    //逆ジオコーディング
    self.geocoder.reverseGeocodeLocation( location, completionHandler: { ( placemarks, error ) in
        if let placemark = placemarks?.first {
            //位置情報
            self.country = placemark.country ?? ""
            self.administrativeArea = placemark.administrativeArea ?? ""
            self.locality = placemark.locality ?? ""
            print(self.locality)
            if self.locality.contains("神戸") { // -> true
                
                self.localImage="kobe"
            }else{
                self.localImage="turtlerock"
            }
            print(self.locality)
        }
    } )
  }
    
}
