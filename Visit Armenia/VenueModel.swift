//
//  VenueModel.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/28/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import ObjectMapper

class VenueModel: Mappable {

    var id: String!
    var name: String!
    var lat: Double!
    var lng: Double!
    var formattedAddress: [String]!
    var formattedPhone: String!
    var facebook: String!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        lat <- map["location.lat"]
        lng <- map["location.lng"]
        formattedAddress <- map["location.formattedAddress"]
        formattedPhone <- map["contact.formattedPhone"]
        facebook <- map["contact.facebook"]
    }
    
}
