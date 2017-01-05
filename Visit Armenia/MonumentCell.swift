//
//  MonumentCell.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 12/20/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

class MonumentCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var infoText: UILabel!
    @IBOutlet weak var myCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCellView.layer.cornerRadius = 10
        myCellView.layer.masksToBounds = true
        myCellView.layer.shadowColor = UIColor.black.cgColor
        myCellView.layer.shadowOffset = .zero
        myCellView.layer.shadowOpacity = 0.5
        myCellView.layer.shadowRadius = 5
    }
    
}
