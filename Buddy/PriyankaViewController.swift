//
//  PriyankaViewController.swift
//  Buddy
//
//  Created by Priyanka on 11/26/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit

class PriyankaViewController: UIViewController {

    @IBOutlet weak var pri: UILabel!
    var trytext:String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("\(trytext)")
        pri.text=trytext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
