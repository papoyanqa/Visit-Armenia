//
//  HomeVC.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/12/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var slideMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            slideMenu.target = self.revealViewController()
            slideMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
