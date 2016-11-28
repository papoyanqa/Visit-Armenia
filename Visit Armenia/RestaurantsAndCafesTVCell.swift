//
//  RestaurantsAndCafesTVCell.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/28/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

class RestaurantsAndCafesTVCell: UITableViewCell {
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeNumber: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var placeAdress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
