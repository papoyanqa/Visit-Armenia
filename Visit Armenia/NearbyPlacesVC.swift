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
        placesClient?.currentPlace(callback: { (placeLikelihoods, error) -> Void in
            guard error == nil else {
                print("Current Place error: \(error!.localizedDescription)")
                return
            }
            
            if let placeLikelihoods = placeLikelihoods {
                for likelihood in placeLikelihoods.likelihoods {
                    let place = likelihood.place
                    print("Current Place name \(place.name) at likelihood \(likelihood.likelihood)")
                    print("Current Place address \(place.formattedAddress)")
                    print("Current Place attributions \(place.attributions)")
                    print("Current PlaceID \(place.placeID)")
                }
            }
        })
    }
    
    
}
	 
