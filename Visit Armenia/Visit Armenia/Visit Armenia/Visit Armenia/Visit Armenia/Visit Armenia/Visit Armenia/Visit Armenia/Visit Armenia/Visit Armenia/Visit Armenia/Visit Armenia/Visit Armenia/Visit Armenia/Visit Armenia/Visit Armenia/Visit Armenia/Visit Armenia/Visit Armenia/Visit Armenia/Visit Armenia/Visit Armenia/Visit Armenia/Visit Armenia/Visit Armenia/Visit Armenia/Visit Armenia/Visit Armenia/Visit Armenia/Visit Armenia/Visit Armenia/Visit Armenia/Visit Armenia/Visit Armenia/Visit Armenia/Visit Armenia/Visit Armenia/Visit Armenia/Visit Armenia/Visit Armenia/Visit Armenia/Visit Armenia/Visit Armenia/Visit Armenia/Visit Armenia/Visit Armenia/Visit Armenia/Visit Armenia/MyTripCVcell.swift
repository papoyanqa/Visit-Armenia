//
//  MyTripCVcell.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/15/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit
import Foundation

class MyTripCVcell: UICollectionViewCell {
    @IBOutlet weak var imageViewText: UILabel!
    @IBOutlet weak var viewDetailsBtn: UIButton!
    @IBOutlet weak var imageViewTour: UIImageView!
    @IBOutlet var taxtLabelInfo: UILabel!
    let VC = MyTripCollectionVC()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.viewDetailsBtn.layer.cornerRadius = 8
    }
    
    @IBAction func action(_ sender: AnyObject) {

    }
    
    
 
}
