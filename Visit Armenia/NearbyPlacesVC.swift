//
//  NearbyPlacesVC.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/13/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GoogleMapsCore


class NearbyPlacesVC: UIViewController {
    @IBOutlet var location: UIBarButtonItem!
    @IBOutlet var slideMenu: UIBarButtonItem!
    var placesClient: GMSPlacesClient?
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.requestWhenInUseAuthorization()
        
        if revealViewController() != nil {
            slideMenu.target = self.revealViewController()
            slideMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        placesClient = GMSPlacesClient.shared()
        GMSServices.provideAPIKey("AIzaSyCUb5kRV6wG4Ez5ECgYGNcG0zmSU2IpriQ")
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 20)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let currentLocation = CLLocationCoordinate2DMake((locationManager.location?.coordinate.latitude)!, (locationManager.location?.coordinate.longitude)!)
        let marker = GMSMarker(position: currentLocation)
        marker.map = mapView
    }
    
    @IBAction func location(_ sender: UIBarButtonItem) {
            let center = CLLocationCoordinate2DMake(51.5108396, -0.0922251)
            let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
            let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
            let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
            let config = GMSPlacePickerConfig(viewport: viewport)
            placePicker = GMSPlacePicker(config: config)
            
            placePicker?.pickPlaceWithCallback({ (place: GMSPlace?, error: NSError?) -> Void in
                if let error = error {
                    print("Pick Place error: \(error.localizedDescription)")
                    return
                }
                
                if let place = place {
                    print("Place name \(place.name)")
                    print("Place address \(place.formattedAddress)")
                    print("Place attributions \(place.attributions)")
                } else {
                    print("No place selected")
                }
            })
        }
    
    
}
	 
