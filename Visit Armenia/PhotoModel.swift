//
//  PhotoModel.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/28/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import ObjectMapper

class PhotoModel: Mappable {

    var prefix: String?
    var suffix: String?
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        prefix <- map["prefix"]
        suffix <- map["suffix"]
    }

}
