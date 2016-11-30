//
//  ProfileViewController.swift
//  Buddy
//
//  Created by Priyanka on 11/28/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!

    @IBOutlet weak var updateButton: UIBarButtonItem!
    
    
    
    //webservice declarations
    var urll = "http://localhost:3000";
    let para:NSMutableDictionary = NSMutableDictionary();
    
    var prefsEmail:String=""
    
    var fullName: String=""
    var email: String=""
    var gender: String=""
    var height: String=""
    var weight: String=""
    var dailyGoal: String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prefsEmail=UserDefaults.standard.value(forKey: "prefsEmail")! as! String
        //print("Profile View Controller**********\(prefsEmail)***************")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
       if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
//        para.setValue(prefsEmail, forKey: "email")
//        para.setValue("getDetails", forKey: "decidingString")
//        
//        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
//        let request:NSMutableURLRequest=NSMutableURLRequest();
//        let session = URLSession.shared
//        let url = urll+"/updateProfile";
//        request.url=NSURL(string:url) as URL?
//        request.httpMethod = "POST";
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
//        request.httpBody = jsonData;
//        print("Sending",request)
//        
//        let task = session.dataTask(with: request as URLRequest, completionHandler: {
//            (data, response, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else {
//                do {
//                    if let response :NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? NSDictionary
//                    {
//                        
//                        let resResult : [Dictionary<String, AnyObject>] = response["result"] as! [Dictionary<String, AnyObject>];
//                        
//                        if(resResult.isEmpty)
//                        {
//                            //                            DispatchQueue.main.async(execute: {
//                            //                                print("Sorry no data Found.");
//                            //                            })
//                        }
//                        else{
//                            //                            print(resResult.count)
//                            for anItem in resResult {
//                                //print(anItem)
//                                self.fullName = (anItem["name"] as! String)
//                                self.email = (anItem["email"] as! String)
//                                self.gender = (anItem["gender"] as! String)
//                                self.height = (anItem["height"] as! String)
//                                self.weight = (anItem["weight"] as! String)
//                                self.dailyGoal = (anItem["calories"] as! String)
//                            }
//                            DispatchQueue.main.async {
//                                self.tableView.reloadData()
//                            }
//                            
//                        }
//                    }
//                    
//                }//do
//                    
//                catch {
//                    print("error in JSONSerialization")
//                }
//                
//            }
//            
//        })
//        task.resume()
//        

        
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
        return 7
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProfileTableViewCell

        // Configure the cell...

        if indexPath.row == 0 {
            cell.key.text = "Full Name"
            cell.value.text = "Priyanka Uppu"
            
        }
        else if indexPath.row == 1 {
            cell.key.text = "Password"
            cell.value.text = "*****"
        }
        else if indexPath.row == 2 {
            cell.key.text = "Email"
            cell.value.text = "uppu@usc.edu"
        }
        else if indexPath.row == 3 {
            cell.key.text = "Gender"
            cell.value.text = "Female"
           
        }
        else if indexPath.row == 4 {
            cell.key.text = "Height"
            cell.value.text = "5.5"
            self.height = cell.value.text!
            
        }
        else if indexPath.row == 5 {
            cell.key.text = "Weight"
            cell.value.text = "50"
        }
        else {
            cell.key.text = "Daily Goal(in kCal)"
            cell.value.text = "20000"
            
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
    
    
    @IBAction func updateButtonClicked(_ sender: UIBarButtonItem) {
        
//        let prefsEmail = UserDefaults.standard.value(forKey: "prefsEmail")!
//        para.setValue(prefsEmail, forKey: "email")
//        para.setValue("updateDetails", forKey: "decidingString")
//        para.setValue("snehal.sdt@gmail.com", forKey: "email");
//        para.setValue(self.fullName, forKey: "name");
//        para.setValue(self.gender, forKey: "gender");
//        para.setValue(self.height, forKey: "height");
//        para.setValue(self.weight, forKey: "weight");
//        para.setValue(self.dailyGoal, forKey: "calories");
//        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
//        let request:NSMutableURLRequest=NSMutableURLRequest();
//        let session = URLSession.shared
//        let url = urll+"/updateProfile";
//        request.url=NSURL(string:url) as URL?
//        request.httpMethod = "POST";
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
//        request.httpBody = jsonData;
//        print("Sending",request)
//        
//        let task = session.dataTask(with: request as URLRequest, completionHandler: {
//            (data, response, error) in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else {
//                do {
//                    print("****************////",response)
//                    if let response :NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? NSDictionary
//                    {
//                     print("****************////",response)
//                        let resResult : [Dictionary<String, AnyObject>] = response["success"] as! [Dictionary<String, AnyObject>];
//                        
//                        if(resResult.isEmpty)
//                        {
//                            //                            DispatchQueue.main.async(execute: {
//                            //                                print("Sorry no data Found.");
//                            //                            })
//                        }
//                        else{
//                            //                            print(resResult.count)
//                            for anItem in resResult {
//                                //print(anItem)
//                                self.fullName = (anItem["name"] as! String)
//                                self.email = (anItem["email"] as! String)
//                                self.gender = (anItem["gender"] as! String)
//                                self.height = (anItem["height"] as! String)
//                                self.weight = (anItem["weight"] as! String)
//                                self.dailyGoal = (anItem["calories"] as! String)
//                            }
//                            DispatchQueue.main.async {
//                                self.tableView.reloadData()
//                            }
//                            
//                        }
//                    }
//                    
//                }//do
//                    
//                catch {
//                    print("error in JSONSerialization")
//                }
//                
//            }
//            
//        })
//        task.resume()
        

    }

}
