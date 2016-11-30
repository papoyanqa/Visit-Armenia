//
//  Networking.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/28/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import AlamofireObjectMapper
import Alamofire

class Networking: NSObject {
    
    static let clientId = "JAGWAL15CUHQYNQRJFARPOHQLZGLDCQH5HFCZQYPXPWATYDT"
    static let clientSecret = "41JB3UGYDU5WOCVCBFF51B5UGBVNUFF4PKPJ5TNJUXZVPKNE"
    
    static func searchVenues(lat: Double, lng: Double, cat: String, completion: @escaping (_ result: VenuesSearchModel?, _ error: Error?) -> Void) {
        let url = "https://api.foursquare.com/v2/venues/search?ll=\(lat),\(lng)&client_id=\(Networking.clientId)&client_secret=\(Networking.clientSecret)&v=20161128&radius=2000&categoryId=\(cat)"
        Alamofire.request(url).responseObject { (response: DataResponse<VenuesSearchModel>) in
            if let search = response.result.value {
                completion(search, nil)
            } else {
                completion(nil, response.result.error)
            }
        }
    }
    
    static func getPhotoUrl(id: String, completion: @escaping (_ result: String?, _ error: Error?) -> Void) {
        let url = "https://api.foursquare.com/v2/venues/\(id)/photos?limit=1&client_id=\(Networking.clientId)&client_secret=\(Networking.clientSecret)&v=20161128"
        Alamofire.request(url).responseArray(keyPath: "response.photos.items") { (response: DataResponse<[PhotoModel]>) in
            if let photos = response.result.value {
                if photos.first?.suffix == nil || photos.first?.prefix == nil {
                    completion("test", nil)
                } else {
                    completion((photos.first?.prefix)! + "100x100" + (photos.first?.suffix)!, nil)
                }
            } else {
                completion(nil, response.result.error)
            }
        }
    }
    
}
