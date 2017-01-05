//
//  MonumentsVC.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 12/20/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MonumentsVC: UICollectionViewController {
    @IBOutlet weak var slideMenu: UIBarButtonItem!

    var arrayOfNames: [String] = ["Geghard Monastery", "Garni Temple", "Tatev Monastery", "Mother Armenia", "Saint Sargis Church", "Etchmiadzin Cathedral", "Noravank", "Ghazanchecoc Church", "Gandzasar monastery"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var image: UIImage!
        var newImage: UIImage!
        image = UIImage(named: "Menu_100px_1.png")
        newImage = resizeImage(image: image, newWidth: 25)
        slideMenu.image = newImage
        slideMenu.accessibilityFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        navigationController?.navigationBar.barTintColor = UIColor.clear
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        slideMenu.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
        if revealViewController() != nil {
            slideMenu.target = self.revealViewController()
            slideMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(MonumentCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrayOfNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MonumentCell
    
        cell.nameText.text = arrayOfNames[indexPath.row]
        cell.imageView.image = UIImage(named: "geghard.jpg")
        cell.infoText.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        // Configure the cell
    
        if ((indexPath as NSIndexPath).row == 0) {
            cell.imageView.image = UIImage(named: "geghard.jpg")
        }
        
        if ((indexPath as NSIndexPath).row == 1) {
            cell.imageView.image = UIImage(named: "Garni_Temple.jpg")
        }

        if ((indexPath as NSIndexPath).row == 2) {
            cell.imageView.image = UIImage(named: "tatev_monastery.jpg")
        }
        
        if ((indexPath as NSIndexPath).row == 3) {
            cell.imageView.image = UIImage(named: "mother.jpg")
        }
        
        if ((indexPath as NSIndexPath).row == 4) {
            cell.imageView.image = UIImage(named: "sargis.jpg")
        }
        
        if ((indexPath as NSIndexPath).row == 5) {
            cell.imageView.image = UIImage(named: "echmiadzin.jpg")
        }
        

        
        return cell
    }

    // MARK: UICollectionViewDelegate

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
