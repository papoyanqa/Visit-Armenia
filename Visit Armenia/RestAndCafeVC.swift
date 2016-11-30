//
//  RestAndCafeVC.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/29/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlacePicker
import GoogleMapsCore


class RestAndCafeTV: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var placesTV: UITableView!
    @IBOutlet weak var mapViewMain: UIView!
    @IBOutlet weak var slideMenu: UIBarButtonItem!

    
    var image: UIImage!
    var newImage: UIImage!
    var venuesSearch: VenuesSearchModel!
    var placesClient: GMSPlacesClient?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
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
        
//        GMSServices.provideAPIKey("AIzaSyCUb5kRV6wG4Ez5ECgYGNcG0zmSU2IpriQ")
//        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 6)
//        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
//        mapView.mapType = kGMSTypeSatellite
//        mapView.isMyLocationEnabled = true
        
        OperationQueue.main.addOperation {
            let mapVC = MapViewController()
            mapVC.latitude = 44.30
            mapVC.longitude = 44.50
            self.addChildViewController(mapVC)
            mapVC.didMove(toParentViewController: self)
            mapVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            mapVC.view.center = self.mapViewMain.center
            self.mapViewMain.autoresizesSubviews = true
            self.mapViewMain.addSubview(mapVC.view)
        }
        
        Networking.searchVenues(lat: (locationManager.location?.coordinate.latitude)!, lng: (locationManager.location?.coordinate.longitude)!, cat: "4d4b7105d754a06374d81259", completion: { (response: VenuesSearchModel?, error: Error?) in
            if response != nil {
                self.venuesSearch = response
                self.placesTV.reloadData()
            }
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venuesSearch != nil ? venuesSearch.venues.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestAndCafeTVC
        let venue = venuesSearch.venues[indexPath.row]
        
        cell.placeName.text = venue.name
        Networking.getPhotoUrl(id: venue.id, completion:  { (result: String?, error: Error?) in
            let url = URL(string: result!)
            if url == nil {
                cell.iconImage.image = UIImage(named: "Garni.jpg")
            } else {
                cell.iconImage.kf.setImage(with: url)
            }
        })
        
        return cell
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
