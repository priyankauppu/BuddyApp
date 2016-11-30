//
//  BuddiesGoingTableViewController.swift
//  Buddy
//
//  Created by Priyanka on 11/27/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit
import CoreLocation

class BuddiesGoingTableViewController: UITableViewController {
    var restaurant:String = "";
    var cuisine:String = "";
    var restaurantLatitude:Double = 0.0
    var restaurantLongitude:Double = 0.0
    
    var buddyName:[String]=[]
    var buddyCuisine:[String]=[]
    var buddyRestaurant:[String]=[]
    var buddyEmail:[String]=[]
    
    let locationManager = CLLocationManager()
    var location:CLLocation=CLLocation()
    
    //webservice declarations
    var urll = "http://localhost:3000";
    let para:NSMutableDictionary = NSMutableDictionary();
    
    
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
        
        findNearByBuddies()
        
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
            let nextController = next.topViewController as! DirectionViewController
            nextController.restaurantLatitude=restaurantLatitude
            nextController.restaurantLongitude=restaurantLongitude
        }
        if (segue.identifier == "buddyRequestSegue" )
        {
            let next = segue.destination as! UINavigationController
            let nextController = next.topViewController as! DirectionViewController
            nextController.displayMessage="Your request has been sent successfully"
            nextController.restaurantLatitude=restaurantLatitude
            nextController.restaurantLongitude=restaurantLongitude
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return buddyName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BuddiesGoingTableViewCell
        
        // Configure the cell...
        let buddyName = self.buddyName[indexPath.row]
        let buddyRestaurant=self.buddyRestaurant[indexPath.row]
        let buddyCuisine=self.buddyCuisine[indexPath.row]
        let buddyEmail=self.buddyEmail[indexPath.row]
        
        
        cell.buddyName.text = buddyName
        cell.buddyRestaurant.text = buddyRestaurant
        cell.buddyCuisine.text = buddyCuisine
        cell.buddyEmail.text=buddyEmail
        cell.buddyEmail.isHidden=true
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
                                print(anItem)
                                self.buddyName.append(anItem["name"] as! String)
                                self.buddyRestaurant.append(anItem["restaurant"] as! String)
                                self.buddyCuisine.append(anItem["cuisine"] as! String)
                                self.buddyEmail.append(anItem["email"] as! String)
                            }
                            DispatchQueue.main.async {
                                print("Buddy List",self.buddyName)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as! BuddiesGoingTableViewCell
        print("Index",indexPath)
        
        //Access today's timestamp
        
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        print("Todays date",date)
        let dateString = dateFormatter.string(from: date as Date)
        
        para.setValue(buddyCuisine, forKey: "cuisine");
        para.setValue(buddyRestaurant, forKey: "restaurant");
        para.setValue("Snehal", forKey: "reqSenderPersonName");//logged in
        para.setValue("snehal.sdt@gmail.com", forKey: "reqSenderPersonEmail")
        para.setValue(cell.buddyName, forKey: "reqReceiverPersonEmail");
        para.setValue(cell.buddyEmail, forKey: "reqReceiverPersonName");
        para.setValue("10 mins", forKey: "time");
        para.setValue(dateString, forKey: "date");
        
        if let dataToSend = cell.buddyName {
            performSegue(withIdentifier: "buddyRequestSegue", sender: self)
        }
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
