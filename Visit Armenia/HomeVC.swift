//
//  HomeVC.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/12/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var slideMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var image: UIImage!
        var newImage: UIImage!
        imageVIew.image = UIImage(named: "MainPageBackgroun_opera.png")
        image = UIImage(named: "Menu_100px_1.png")
        newImage = resizeImage(image: image, newWidth: 25)
        slideMenu.image = newImage
        slideMenu.accessibilityFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        navigationController?.navigationBar.barTintColor = UIColor.clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        slideMenu.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            if revealViewController() != nil {
                slideMenu.target = self.revealViewController()
                slideMenu.action = #selector(SWRevealViewController.revealToggle(_:))
                self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
        
        let deadlineTime = DispatchTime.now() + .seconds(4)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
//            UIView.animate(withDuration: 3, animations: {
//                self.imageVIew.alpha = 1
//                self.imageVIew.alpha = 0
//            })
//            
//            
//            UIView.animate(withDuration: 1.5, animations: {
//                self.imageVIew.alpha = 1
//                self.imageVIew.image = UIImage(named: "mother.jpg")
//            })
//            
//            
//            
            
            self.fadeOut()
            self.fadeIn()
        }

        
        
    }
    
    func fadeIn(withDuration duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.imageVIew.image = UIImage(named: "mother.jpg")
            self.imageVIew.alpha = 1.0
        })
    }
    
    /**
     Fade out a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeOut(withDuration duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.imageVIew.image = nil
            self.imageVIew.alpha = 0.0
        })
    }
    
        
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
}
