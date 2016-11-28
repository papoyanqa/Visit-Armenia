//
//  Networking.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/28/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire

class Networking: NSObject {
    
    func test() {
        let URL = "https://api.foursquare.com/v2/venues/search?ll=40.7,-74&client_id=JAGWAL15CUHQYNQRJFARPOHQLZGLDCQH5HFCZQYPXPWATYDT&client_secret=41JB3UGYDU5WOCVCBFF51B5UGBVNUFF4PKPJ5TNJUXZVPKNE&v=20161128"
        Alamofire.request(URL).responseObject { (response: DataResponse<WeatherResponse>) in
            
            let weatherResponse = response.result.value
            print(weatherResponse?.location)
            
            if let threeDayForecast = weatherResponse?.threeDayForecast {
                for forecast in threeDayForecast {
                    print(forecast.day)
                    print(forecast.temperature)
                }
            }
        }
    }
}
