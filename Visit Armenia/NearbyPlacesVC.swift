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
        
        var image: UIImage!
        var newImage: UIImage!
        image = UIImage(named: "Menu_100px_1.png")
        newImage = resizeImage(image: image, newWidth: 25)
        slideMenu.image = newImage
        slideMenu.accessibilityFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        slideMenu.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        slideMenu.title = nil
        slideMenu.tintColor = UIColor.black
        if revealViewController() != nil {
            slideMenu.target = self.revealViewController()
            slideMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        placesClient = GMSPlacesClient.shared()
        GMSServices.provideAPIKey("AIzaSyCUb5kRV6wG4Ez5ECgYGNcG0zmSU2IpriQ")
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 17)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let currentLocation = CLLocationCoordinate2DMake((locationManager.location?.coordinate.latitude)!, (locationManager.location?.coordinate.longitude)!)
        let marker = GMSMarker(position: currentLocation)
        marker.map = mapView
       
    }
    
    @IBAction func location(_ sender: UIBarButtonItem) {
        print(locationManager.location?.coordinate.latitude)
        print(locationManager.location?.coordinate.longitude)
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
	 
