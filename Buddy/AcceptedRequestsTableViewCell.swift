//
//  AcceptedRequestsTableViewCell.swift
//  Buddy
//
//  Created by Priyanka on 11/28/16.
//  Copyright © 2016 Priyanka. All rights reserved.
//

import UIKit

class AcceptedRequestsTableViewCell: UITableViewCell {

    @IBOutlet weak var buddyName: UILabel!
    
    @IBOutlet weak var buddyEmail: UILabel!
    
    @IBOutlet weak var buddyRestaurant: UILabel!
    
    @IBOutlet weak var buddyCuisine: UILabel!
    
    @IBOutlet weak var buddyTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
