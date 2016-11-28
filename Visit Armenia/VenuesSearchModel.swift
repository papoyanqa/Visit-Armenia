//
//  VenuesSearchModel.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/28/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import ObjectMapper

class VenuesSearchModel: Mappable {
    
    var venues: [VenueModel]!
    var code: Int!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        code <- map["meta.code"]
        venues <- map["response.venues"]
    }

}
