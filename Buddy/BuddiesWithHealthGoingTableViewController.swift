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
    var buddyEmail:[String]=[]
    
    let locationManager = CLLocationManager()
    var location:CLLocation=CLLocation()
    
    //webservice declarations
    var urll = "http://localhost:3000";
    let para:NSMutableDictionary = NSMutableDictionary();
    let para1:NSMutableDictionary = NSMutableDictionary();
    
    var prefsEmail:String=""
     var prefsName:String=""
    
    var testName: String = ""
    var testEmail: String = ""
    
    var testCuisine: String = ""
    var testRestaurant: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        prefsEmail=UserDefaults.standard.value(forKey: "prefsEmail")! as! String
        prefsName=UserDefaults.standard.value(forKey: "prefsName")! as! String
        print("Buddies with health View Controller**********\(prefsEmail)***************")
        print("********\(restaurant)********\(cuisine)***************")
        
        //Calling webservice to retrieve the nearby Buddies
        findNearByBuddies()
        
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
        if (segue.identifier == "buddyRequestSegue" )
        {
            sendInvite()
            let next = segue.destination as! UINavigationController
            // let text1:String=(sender as! MKAnnotationView).annotation!.title!!
            let nextController = next.topViewController as! DirectionWithHealthViewController
            //nextController.userLatitude=userLatitude
            //nextController.userLongitude=userLongitude
            nextController.displayMessage="Your request has been sent successfully"
            //            nextController.buddyEmail=
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
        return  buddyName.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BuddiesWithHealthGoingTableViewCell
        
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
    
    func sendInvite()
    {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        print("Todays date",date)
        let dateString = dateFormatter.string(from: date as Date)
        
        para1.setValue("Coffee", forKey: "cuisine");
        para1.setValue(testRestaurant, forKey: "restaurant");
        para1.setValue(prefsName, forKey: "reqSenderPersonName");//logged in
        para1.setValue(prefsEmail, forKey: "reqSenderPersonEmail")
        para1.setValue(testEmail, forKey: "reqReceiverPersonEmail");
        para1.setValue(testName, forKey: "reqReceiverPersonName");
        para1.setValue("10 mins", forKey: "time");
        para1.setValue(dateString, forKey: "date");
        
        print("*****NAME",prefsEmail,"*******NORPREFS",testEmail)
        
        let jsonData = try! JSONSerialization.data(withJSONObject: para1, options: JSONSerialization.WritingOptions());
        let request:NSMutableURLRequest=NSMutableURLRequest();
        let session = URLSession.shared
        let url = urll+"/requestBuddy";
        request.url=NSURL(string:url) as URL?
        request.httpMethod = "POST";
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.httpBody = jsonData;
        print("Sending",request)
        print("**********HELLLLLOOOOOO***********")
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
        })
        task.resume()

    }
    
    func findNearByBuddies(){
        let location_coordinate=location.coordinate
        
        para.setValue("Coffee", forKey: "cuisine");
        para.setValue(restaurant, forKey: "restaurant");
        para.setValue(prefsName, forKey: "name");
        para.setValue(prefsEmail, forKey: "email")
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
                                self.buddyEmail.append(anItem["email"] as! String)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as! BuddiesWithHealthGoingTableViewCell
        print("Index",indexPath)
        testName = cell.buddyName.text!
        testEmail = cell.buddyEmail.text!
        testCuisine = cell.buddyCuisine.text!
        testRestaurant = cell.buddyRestaurant.text!
        //Access today's timestamp
         sendInviteButtonClicked(testName: testName, testEmail: testEmail)
       
        if let dataToSend = cell.buddyName {
            performSegue(withIdentifier: "buddyRequestSegue", sender: self)
        }
    }
    func sendInviteButtonClicked(testName:String,testEmail:String){
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        let dateString = dateFormatter.string(from: date as Date)
        
        para.setValue(buddyCuisine, forKey: "cuisine");
        para.setValue(buddyRestaurant, forKey: "restaurant");
        para.setValue(prefsName, forKey: "reqSenderPersonName");//logged in
        para.setValue(prefsEmail, forKey: "reqSenderPersonEmail")
        para.setValue(testName, forKey: "reqReceiverPersonEmail");
        para.setValue(testEmail, forKey: "reqReceiverPersonName");
        para.setValue("10 mins", forKey: "time");
        para.setValue(dateString, forKey: "date");
        
        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
        let request:NSMutableURLRequest=NSMutableURLRequest();
        let session = URLSession.shared
        let url = urll+"/requestBuddy";
        request.url=NSURL(string:url) as URL?
        request.httpMethod = "POST";
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.httpBody = jsonData;
        print("Sending",request)
        print("**********HELLLLLOOOOOO***********")
        
    }
    

    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
     if (segue.identifier == "buddyRequestSegue" )
     {
     
     let next = segue.destination as! UINavigationController
     let nextController = next.topViewController as! DirectionWithHealthViewController
     
     nextController.message="Your request has been sent"
     
     
     }
     }*/
    
    
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     
     
     }*/
    
    
}
