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
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
       if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
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
        return 8
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProfileTableViewCell

        // Configure the cell...

        if indexPath.row == 0 {
            cell.key.text = "Full Name"
            cell.value.text = "Priyanka Uppu"
        }
        else if indexPath.row == 1 {
            cell.key.text = "User Name"
            cell.value.text = "priyankauppu"
        }
        else if indexPath.row == 2 {
            cell.key.text = "Password"
            cell.value.text = "*****"
        }
        else if indexPath.row == 3 {
            cell.key.text = "Email"
            cell.value.text = "uppu@usc.edu"
        }
        else if indexPath.row == 4 {
            cell.key.text = "Gender"
            cell.value.text = "Female"
        }
        else if indexPath.row == 5 {
            cell.key.text = "Height"
            cell.value.text = "5 5"
        }
        else if indexPath.row == 6 {
            cell.key.text = "Weight"
            cell.value.text = "140 Lb"
        }
        else {
            cell.key.text = "Daily Goal(in kCal)"
            cell.value.text = "500"
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
       /* para.setValue(Email.text, forKey: "email");
        para.setValue(Name.text, forKey: "name");
        para.setValue(Gender.text, forKey: "gender");
        para.setValue(Height.text, forKey: "height");
        para.setValue(Weight.text, forKey: "weight");
        para.setValue(Cal.text, forKey: "calories");
        let jsonData = try! JSONSerialization.data(withJSONObject: para, options: JSONSerialization.WritingOptions());
        let request:NSMutableURLRequest=NSMutableURLRequest();
        let session = URLSession.shared
        let url = urll+"/updateProfile";
        request.url=NSURL(string:url) as URL?
        request.httpMethod = "POST";
        request.setValue("application/json", forHTTPHeaderField: "Content-Type");
        request.httpBody = jsonData;
        print("Sending",request)
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            print("----------",data)
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let response :NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? NSDictionary
                    {
                        
                        if (response["res"] as? Int == 0){
                            print("---response",response["response"]);
                        }
                        else
                        {
                            print(response["response"],"------email---",response["email"])
                            self.flag = 1
                        }
                    }//do
                }catch {
                    print("error in JSONSerialization")
                }
            }
        })
        task.resume()
        let refreshAlert = UIAlertController(title: "PROFILE UPDATE!!", message: "Update successful", preferredStyle: UIAlertControllerStyle.alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Update successful")
            print("pusername=",self.Pusername.text)
            print("ppassword=",self.Ppassword.text)
            print("Name",self.Name)
            print("email",self.Email)
            print("gender",self.Gender)
            print("height",self.Height)
            print("weight",self.Weight)
            print("cal",self.Cal)
            if(self.flag == 1)
            {
                self.performSegue(withIdentifier: "profilemenu", sender: nil)
            }
        }))
        present(refreshAlert, animated: true, completion: nil)
        
*/    }

}
