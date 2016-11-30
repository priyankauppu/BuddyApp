//
//  PendingRequestsTableViewController.swift
//  Buddy
//
//  Created by Priyanka on 11/28/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit

class PendingRequestsTableViewController: UITableViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    var prefsEmail:String=""
    
    //webservice declarations
    var urll = "http://localhost:3000";
    let para:NSMutableDictionary = NSMutableDictionary();
    
    var buddyName:[String]=[]
    var buddyEmail:[String]=[]
    var buddyCuisine:[String]=[]
    var buddyRestaurant:[String]=[]
    var buddyDate:[String]=[]
    var buddyId:[String]=[]
    
    var testDate:String = ""
    var testId:String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prefsEmail=UserDefaults.standard.value(forKey: "prefsEmail")! as! String
        //print("Pending Requests View Controller**********\(prefsEmail)***************")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        let userEmail:String="uppu@usc.edu"
        //call web service
        
        getPendingRequests(userEmail: userEmail)
        
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
        return buddyName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PendingRequestsTableViewCell

        // Configure the cell...
        let buddyName = self.buddyName[indexPath.row]
        let buddyEmail=self.buddyEmail[indexPath.row]
        let buddyRestaurant=self.buddyRestaurant[indexPath.row]
        let buddyCuisine=self.buddyCuisine[indexPath.row]
        let buddyDate = self.buddyDate[indexPath.row]
        let buddyId = self.buddyId[indexPath.row]
        //let buddyEmail=self.buddyEmail[indexPath.row]
        
        cell.buddyName.text = buddyName
        cell.buddyEmail.text = buddyEmail
        cell.buddyRestaurant.text = buddyRestaurant
        cell.buddyCuisine.text = buddyCuisine
        cell.buddyDate.text = buddyDate
        cell.buddyId.text = buddyId
        // cell.time.text = buddy.time
        //cell.place.text = buddy.place
        //cell.photoImageView.image = buddy.photo
        return cell
    }
    
    func getPendingRequests(userEmail:String){
        
        //Call the web service getAcceptedBuddy
        para.setValue(userEmail, forKey: "email");
        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
        let request:NSMutableURLRequest=NSMutableURLRequest();
        let session = URLSession.shared
        let url = urll+"/getRequestedBuddy";
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
                    let response = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions())
                    
                    print(response)
                    for anItem in response as! [Dictionary<String, String>] {
                        self.buddyName.append(anItem["ReqFromName"]!)
                        self.buddyEmail.append(anItem["ReqFromEmail"]!)
                        self.buddyCuisine.append(anItem["cuisine"]!)
                        self.buddyRestaurant.append(anItem["restaurant"]!)
                        self.buddyDate.append(anItem["date"]!)
                        self.buddyId.append(anItem["id"]!)
                        
                    }
                    DispatchQueue.main.async {
                        print(self.buddyName)
                        self.tableView.reloadData()
                    }
                    
                    
                }//do
                catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
        
        
    }

    @IBAction func acceptInvite(_ sender: Any) {
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as! PendingRequestsTableViewCell
        print("Index",indexPath)
        testDate = cell.buddyDate.text!
        testId = cell.buddyId.text!
        //testCuisine = cell.buddyCuisine.text!
//        testRestaurant = cell.buddyRestaurant.text!
        //Access today's timestamp
        
        
        buddyAccepted()
    }

    func buddyAccepted()
    {
        para.setValue("Coffee", forKey: "cuisine");
        para.setValue("Starbucks", forKey: "restaurant");
        para.setValue("Snehal", forKey: "reqSenderPersonName");
        para.setValue("snehal.sdt@gmail.com", forKey: "reqSenderPersonEmail")
        para.setValue("uppu@usc.edu", forKey: "reqReceiverPersonEmail");
        para.setValue("Priyanka", forKey: "reqReceiverPersonName");
        para.setValue("10 mins", forKey: "time");
        para.setValue(testDate, forKey: "date");
        para.setValue(testId, forKey: "id");
        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
        let request:NSMutableURLRequest=NSMutableURLRequest();
        let session = URLSession.shared
        let url = urll+"/buddyAccepted";
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
