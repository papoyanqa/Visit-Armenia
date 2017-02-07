//
//  SideBarSTableViewController.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 10/21/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//
import UIKit

class SideBarSTableViewController: UITableViewController {
    
    var tableArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableArray = ["Home", "Nearby Places", "Monuments", "Shopping", "Restaurants and Cafes" , "Events", "Popular Itineraries", "Taxi", "My Trip", "Settings", "About"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableArray[indexPath.row], for: indexPath) as! SlideTableViewCell
        
        if ((indexPath as NSIndexPath).row == 0) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "Home_100px_1.png")
        }
        
        if ((indexPath as NSIndexPath).row == 1) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "Marker_100px.png")
            
        }
        
        if ((indexPath as NSIndexPath).row == 2) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "Museum-100.png")
        }
        
        if ((indexPath as NSIndexPath).row == 3) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "ShoppingBag_100px.png")
        }
        
        if ((indexPath as NSIndexPath).row == 4) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "DiningRoom_100px.png")
        }
        
        if ((indexPath as NSIndexPath).row == 5) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "ChristmasStar_100px.png")
        }
        
        if ((indexPath as NSIndexPath).row == 6) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "Idea_100px.png")
        }
        
        if ((indexPath as NSIndexPath).row == 7) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "Taxi_100px.png")
        }
        
        if ((indexPath as NSIndexPath).row == 8) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "Suitcase_100px.png")
        }   
        
        if ((indexPath as NSIndexPath).row == 9) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "Support_100px.png")
        }
        
        if ((indexPath as NSIndexPath).row == 10) {
            cell.categoryName.text = tableArray[indexPath.row]
            cell.iconView.image = UIImage(named: "About_100px.png")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        if ((indexPath as NSIndexPath).row == 0) {
        //            present(vc, animated: false, completion: nil)
        //
        //            navigationController?.viewControllers = [vc];
        //        }
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
