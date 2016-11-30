//
//  LoginViewController.swift
//  Buddy
//
//  Created by Priyanka on 11/26/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var menuButton: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        //menuButton.accessibilityElementsHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Submit(_ sender: AnyObject) {
        //print("username=*",username.text)
        //print("password=*",password.text)
        performSegue(withIdentifier: "openSWL", sender: self)
        //performSegue(withIdentifier: "loginSegue", sender: self)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if(flag==1){
           // performSegue(withIdentifier: "loginSeague", sender: view)
        if (segue.identifier == "openSWL" )
        {
            UserDefaults.standard.setValue(username.text, forKey: "prefsEmail")
            
            //let next = segue.destination as! UINavigationController
            //let nextController = next.topViewController as! GeoViewController
            //nextController.prefsEmail = username.text!

            
            }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
