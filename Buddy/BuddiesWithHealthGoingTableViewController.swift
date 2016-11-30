//
//  BuddiesWithHealthGoingTableViewController.swift
//  Buddy
//
//  Created by Priyanka on 11/28/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit
import CoreLocation


class BuddiesWithHealthGoingTableViewController: UITableViewController {
    var restaurant:String = "";
    var cuisine:String = "";
    var restaurantLatitude:Double = 0.0
    var restaurantLongitude:Double = 0.0
    
    var buddyName:[String]=[]
    var buddyCuisine:[String]=[]
    var buddyRestaurant:[String]=[]
    
    
    let locationManager = CLLocationManager()
    var location:CLLocation=CLLocation()
    
    //webservice declarations
    var urll = "http://localhost:3000";
    let para:NSMutableDictionary = NSMutableDictionary();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        print("********\(restaurant)********\(cuisine)***************")
        findNearByBuddies()
//        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "directionWithHealthSegue" )
        {
            let next = segue.destination as! UINavigationController
            // let text1:String=(sender as! MKAnnotationView).annotation!.title!!
            let nextController = next.topViewController as! DirectionWithHealthViewController
            //nextController.userLatitude=userLatitude
            //nextController.userLongitude=userLongitude
            nextController.restaurantLatitude=restaurantLatitude
            nextController.restaurantLongitude=restaurantLongitude
            
            
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // print("count",buddyName.count)
        return  buddyName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BuddiesWithHealthGoingTableViewCell

        // Configure the cell...
        let buddyName = self.buddyName[indexPath.row]
        let buddyRestaurant=self.buddyRestaurant[indexPath.row]
        let buddyCuisine=self.buddyCuisine[indexPath.row]
        //let buddyEmail=self.buddyEmail[indexPath.row]
        
        
        cell.buddyName.text = buddyName
        cell.buddyRestaurant.text = buddyRestaurant
        cell.buddyCuisine.text = buddyCuisine


        return cell
    }
    
    func findNearByBuddies(){
        let location_coordinate=location.coordinate
        
        para.setValue("Coffee", forKey: "cuisine");
        para.setValue("Starbucks", forKey: "restaurant");
        para.setValue("Snehal", forKey: "name");
        para.setValue("snehal.sdt@gmail.com", forKey: "email")
        para.setValue(location_coordinate.latitude, forKey: "latitude")
        para.setValue(location_coordinate.longitude, forKey: "longitude")
        
        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
        let request:NSMutableURLRequest=NSMutableURLRequest();
        let session = URLSession.shared
        let url = urll+"/findNearbyBuddies";
        request.url=NSURL(string:url) as URL?
        request.httpMethod = "POST";
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.httpBody = jsonData;
        print("Sending",request)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let response :NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? NSDictionary
                    {
 
                        let resResult : [Dictionary<String, AnyObject>] = response["result"] as! [Dictionary<String, AnyObject>];
                        
                        if(resResult.isEmpty)
                        {
//                            DispatchQueue.main.async(execute: {
//                                print("Sorry no data Found.");
//                            })
                        }
                        else{
//                            print(resResult.count)
                            for anItem in resResult {
                                //print(anItem)
                                self.buddyName.append(anItem["name"] as! String)
                                self.buddyRestaurant.append(anItem["restaurant"] as! String)
                                self.buddyCuisine.append(anItem["cuisine"] as! String)
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                        }
                   }
                
                }//do
                
                catch {
                    print("error in JSONSerialization")
                }
                
            }
            
        })
        task.resume()

        
        
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
