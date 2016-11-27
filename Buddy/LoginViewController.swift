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
    var flag=0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Submit(_ sender: AnyObject) {
        print("username=*",username.text)
        print("password=*",password.text)
        
        self.flag=1
       performSegue(withIdentifier: "loginSeague", sender: view)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if(flag==1){
           // performSegue(withIdentifier: "loginSeague", sender: view)
        if (segue.identifier == "loginSeague" )
        {
            let nextController = segue.destination as! PriyankaViewController
            print ("Next Controller: *\(nextController)*")
            let text1:String=String(describing: username.text)
            nextController.trytext=text1
            
            }//}
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
