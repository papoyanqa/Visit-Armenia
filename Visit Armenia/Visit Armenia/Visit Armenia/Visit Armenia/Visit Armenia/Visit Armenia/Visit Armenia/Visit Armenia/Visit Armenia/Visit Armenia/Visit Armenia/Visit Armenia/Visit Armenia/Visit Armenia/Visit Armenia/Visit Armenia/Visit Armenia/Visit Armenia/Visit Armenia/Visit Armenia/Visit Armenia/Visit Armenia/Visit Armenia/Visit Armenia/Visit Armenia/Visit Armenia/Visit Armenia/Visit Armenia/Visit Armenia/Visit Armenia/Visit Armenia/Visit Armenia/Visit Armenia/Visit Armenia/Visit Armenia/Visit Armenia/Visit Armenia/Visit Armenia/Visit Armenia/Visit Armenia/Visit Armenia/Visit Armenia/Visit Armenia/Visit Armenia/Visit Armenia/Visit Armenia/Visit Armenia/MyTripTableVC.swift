//
//  MyTripTableVC.swift
//  Visit Armenia
//
//  Created by Gagik Papoyan on 11/14/16.
//  Copyright © 2016 Gagik Papoyan. All rights reserved.
//

import UIKit

class MyTripTableVC: UITableViewController {
    var tableArrayLabelString = [String]()
    var tableArrayImageView = [String]()
    var tableIndex = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        tableArrayLabelString = ["Choose this trip and explore the beautys of Yerevan in 3 days.", "Enjoy a 7 day tour around Armenia to discover the ancient culture.", "Enjoy a 10 day tour around Armenia to discover the ancient culture."]
        tableArrayImageView = ["3 Days in Yerevan", "7 Days Tour to The Culture of Armenia", "10 Days Tour to The Culture of Armenia"]
        tableIndex = ["1", "2", "3"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return tableArrayImageView.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTripCell

        if ((indexPath as NSIndexPath).row == 0) {
            cell.imageViewTour.image = UIImage(named: "Yerevan.jpg")
            cell.imageViewText.text = tableArrayImageView[indexPath.row]
            cell.taxtLabelInfo.text = tableArrayLabelString[indexPath.row]
        }
        
        if ((indexPath as NSIndexPath).row == 1) {
            cell.imageViewTour.image = UIImage(named: "tatev_monastery.jpg")
            cell.imageViewText.text = tableArrayImageView[indexPath.row]
            cell.taxtLabelInfo.text = tableArrayLabelString[indexPath.row]
        }
        
        if ((indexPath as NSIndexPath).row == 2) {
            cell.imageViewTour.image = UIImage(named: "Garni.jpg")
            cell.imageViewText.text = tableArrayImageView[indexPath.row]
            cell.taxtLabelInfo.text = tableArrayLabelString[indexPath.row]
        }
        
        
        return cell
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
