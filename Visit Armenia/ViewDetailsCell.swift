//
//  ViewDetailsCell.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/26/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

class ViewDetailsCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = 5.0
        self.imageView.layer.borderWidth = 0.5
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.borderColor = UIColor.clear.cgColor
    }
}
