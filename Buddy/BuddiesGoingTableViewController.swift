//
//  BuddiesGoingTableViewController.swift
//  Buddy
//
//  Created by Priyanka on 11/27/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit

class BuddiesGoingTableViewController: UITableViewController {
    var restaurant:String = "";
    var cuisine:String = "";
    var restaurantLatitude:Double = 0.0
    var restaurantLongitude:Double = 0.0
 
     var prefsEmail:String="";
    
   // var userLatitude:Double=0.0
    //var userLongitude:Double=0.0
   
    //@IBOutlet weak var displayDetails: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
       // displayDetails.text="Your selected Cuisine:\(cuisine), Restaurant: \(restaurant)"

        
        prefsEmail=UserDefaults.standard.value(forKey: "prefsEmail")! as! String
        //print("BUDDIES GOING**********\(prefsEmail)***************")
        print("********\(restaurant)********\(cuisine)***************")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*@IBAction func goAloneClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "directionSegue", sender: view)
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "directionSegue" )
        {
            let next = segue.destination as! UINavigationController
           // let text1:String=(sender as! MKAnnotationView).annotation!.title!!
            let nextController = next.topViewController as! DirectionViewController
            //nextController.userLatitude=userLatitude
            //nextController.userLongitude=userLongitude
            nextController.restaurantLatitude=restaurantLatitude
            nextController.restaurantLongitude=restaurantLongitude
            nextController.prefsEmail = prefsEmail
            
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
