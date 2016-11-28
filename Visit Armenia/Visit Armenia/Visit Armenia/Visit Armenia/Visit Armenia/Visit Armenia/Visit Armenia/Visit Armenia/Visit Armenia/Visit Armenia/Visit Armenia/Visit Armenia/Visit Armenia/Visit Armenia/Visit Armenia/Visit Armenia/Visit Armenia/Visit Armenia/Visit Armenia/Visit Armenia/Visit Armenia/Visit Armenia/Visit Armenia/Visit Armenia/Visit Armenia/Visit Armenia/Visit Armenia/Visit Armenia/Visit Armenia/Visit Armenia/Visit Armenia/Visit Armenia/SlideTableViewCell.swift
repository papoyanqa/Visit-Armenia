//
//  SlideTableViewCell.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/13/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

class SlideTableViewCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
