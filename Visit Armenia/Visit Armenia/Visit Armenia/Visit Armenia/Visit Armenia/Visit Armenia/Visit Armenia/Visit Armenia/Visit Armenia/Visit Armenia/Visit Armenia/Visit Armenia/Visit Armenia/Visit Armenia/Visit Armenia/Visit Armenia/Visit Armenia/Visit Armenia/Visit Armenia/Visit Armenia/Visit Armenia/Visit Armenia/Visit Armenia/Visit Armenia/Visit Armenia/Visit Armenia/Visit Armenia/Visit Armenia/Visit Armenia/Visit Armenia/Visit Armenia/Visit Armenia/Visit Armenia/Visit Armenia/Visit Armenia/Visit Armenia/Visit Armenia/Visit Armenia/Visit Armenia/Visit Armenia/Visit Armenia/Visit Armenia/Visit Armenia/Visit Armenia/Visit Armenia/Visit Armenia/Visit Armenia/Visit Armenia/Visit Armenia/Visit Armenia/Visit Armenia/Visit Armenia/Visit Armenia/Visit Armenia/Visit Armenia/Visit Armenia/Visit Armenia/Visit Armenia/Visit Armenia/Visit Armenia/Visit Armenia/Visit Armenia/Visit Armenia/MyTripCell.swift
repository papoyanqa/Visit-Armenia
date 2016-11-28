//
//  MyTripCell.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/14/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit
import Foundation

class MyTripCell: UITableViewCell {
    @IBOutlet weak var imageViewText: UILabel!
    @IBOutlet weak var viewDetailsBtn: UIButton!
    @IBOutlet weak var imageViewTour: UIImageView!
    @IBOutlet var taxtLabelInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func ViewDetailsBtn(_ sender: AnyObject) {
        print("asdasd")

        
    }

}
