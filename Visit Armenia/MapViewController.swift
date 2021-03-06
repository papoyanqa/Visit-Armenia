//
//  MapViewController.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/30/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import ObjectMapper

class MapViewController: UIViewController {
    let locationManager = CLLocationManager()
    var placesClient: GMSPlacesClient?
    var latitude: Double!
    var longitude: Double!
    var venuesSearch: VenuesSearchModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        OperationQueue.main.addOperation {
            
            self.placesClient = GMSPlacesClient.shared()
            GMSServices.provideAPIKey("AIzaSyCUb5kRV6wG4Ez5ECgYGNcG0zmSU2IpriQ")
            let camera = GMSCameraPosition.camera(withLatitude: self.latitude, longitude:self.longitude, zoom: 15)
            let mapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
            self.view = mapView
            let currentLocation = CLLocationCoordinate2DMake(self.latitude, self.longitude)
            let marker = GMSMarker(position: currentLocation)
            marker.map = mapView
            mapView.animate(toLocation: marker.position)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
