//
//  ViewDetailVC.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/25/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ViewDetailVC: UICollectionViewController {
    var collectionIndex = [String]()
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionIndex = ["1","2"]
        
        if index == 1 {
            
        }
        
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        print(index)
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let a: Int!
        
        if index == 1 {
            a = 1
        } else {
            a = collectionIndex.count
        }
        
        return a
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ViewDetailsCell
        
        if (index == 1) {
            if ((indexPath as NSIndexPath).row == 0){
                cell.imageView.image = UIImage(named: "Yerevan.jpg")
                cell.textView.text = "If someone wants to visit Armenia the journey should start from the heart of the country: Yerevan.  Yerevan is a city of contrasts. Yerevan is a little bright city with charming people in it. It’s hard to get bored in the city as there is so much to see, that you will be confused where to start:  here you can see Soviet style buildings next to modern ones, also some few traces of city’s ancient past remain, many museums, churches, theatres, cozy cafes and a vast variety of taverns serving national cuisine. So let’s have a look at the list of the best places of Yerevan."
            }
            
            if ((indexPath as NSIndexPath).row == 1) {
                cell.imageView.image = nil
                cell.textView.text = nil
            }
        }
        
        // Configure the cell
        
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
