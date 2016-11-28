//
//  BaseNavigationController.swift
//  Visit Armenia
//
//  Created by Bagrat Kirakosian on 11/27/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return (topViewController?.preferredStatusBarStyle)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
