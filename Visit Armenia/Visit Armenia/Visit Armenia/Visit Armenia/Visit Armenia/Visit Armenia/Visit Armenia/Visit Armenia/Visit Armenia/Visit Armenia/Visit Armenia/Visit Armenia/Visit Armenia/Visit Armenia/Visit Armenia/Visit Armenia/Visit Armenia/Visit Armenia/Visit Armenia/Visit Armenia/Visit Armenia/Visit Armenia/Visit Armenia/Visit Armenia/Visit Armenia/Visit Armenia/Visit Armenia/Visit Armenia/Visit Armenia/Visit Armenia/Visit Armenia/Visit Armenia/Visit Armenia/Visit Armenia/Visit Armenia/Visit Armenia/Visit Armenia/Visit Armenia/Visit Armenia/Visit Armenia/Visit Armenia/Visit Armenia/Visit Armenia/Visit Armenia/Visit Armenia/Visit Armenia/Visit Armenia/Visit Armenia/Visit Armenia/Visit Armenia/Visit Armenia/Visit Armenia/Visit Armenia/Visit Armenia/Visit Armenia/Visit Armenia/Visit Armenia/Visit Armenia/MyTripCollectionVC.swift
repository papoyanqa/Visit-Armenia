//
//  MyTripCollectionVC.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/15/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyTripCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var collectionArrayLabelString = [String]()
    var collectionArrayImageView = [String]()
    var collectionIndex = [String]()
    @IBOutlet weak var slideMenu: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var image: UIImage!
        var newImage: UIImage!
        image = UIImage(named: "Menu_100px_1.png")
        newImage = resizeImage(image: image, newWidth: 25)
        slideMenu.image = newImage
        slideMenu.accessibilityFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
        slideMenu.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        slideMenu.title = nil
        slideMenu.tintColor = UIColor.black
        if revealViewController() != nil {
            slideMenu.target = self.revealViewController()
            slideMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }

        collectionArrayLabelString = ["Choose this trip and explore the beautys of Yerevan in 3 days.", "Enjoy a 7 day tour around Armenia to discover the ancient culture.", "Enjoy a 10 day tour around Armenia to discover the ancient culture."]
        collectionArrayImageView = ["3 Days in Yerevan", "7 Days Tour to The Culture of Armenia", "10 Days Tour to The Culture of Armenia"]
        collectionIndex = ["1", "2", "3"]
        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return collectionIndex.count
    }
    
    func buttonTappedFirst() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! ViewDetailVC
        vc.index = 1
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func buttonTappedSecond() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! ViewDetailVC
        vc.index = 2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func buttonTappedThird() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! ViewDetailVC
        vc.index = 3
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyTripCVcell
        
        if ((indexPath as NSIndexPath).row == 0) {
            cell.imageViewTour.image = UIImage(named: "Yerevan.jpg")
            cell.imageViewText.text = collectionArrayImageView[indexPath.row]
            cell.taxtLabelInfo.text = collectionArrayLabelString[indexPath.row]
            cell.viewDetailsBtn.removeTarget(self, action: nil, for: .touchUpInside)
            cell.viewDetailsBtn.addTarget(self, action: #selector(MyTripCollectionVC.buttonTappedFirst), for: .touchUpInside)
        } else
        
        if ((indexPath as NSIndexPath).row == 1) {
            cell.imageViewTour.image = UIImage(named: "tatev_monastery.jpg")
            cell.imageViewText.text = collectionArrayImageView[indexPath.row]
            cell.taxtLabelInfo.text = collectionArrayLabelString[indexPath.row]
            cell.viewDetailsBtn.removeTarget(self, action: nil, for: .touchUpInside)
            cell.viewDetailsBtn.addTarget(self, action: #selector(MyTripCollectionVC.buttonTappedSecond), for: .touchUpInside)
        } else
        
        if ((indexPath as NSIndexPath).row == 2) {
            cell.imageViewTour.image = UIImage(named: "Garni_Temple.jpg")
            cell.imageViewText.text = collectionArrayImageView[indexPath.row]
            cell.taxtLabelInfo.text = collectionArrayLabelString[indexPath.row]
            cell.viewDetailsBtn.addTarget(self, action: #selector(MyTripCollectionVC.buttonTappedThird), for: .touchUpInside)
        }

        return cell
    }
    

    

    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 24, height: 252)
    }
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
