//
//  RestAndCafeTVC.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/29/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

class RestAndCafeTVC: UITableViewCell {
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView?.backgroundColor = UIColor(red: 239, green: 239, blue: 246, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
