//
//  DoctorsTableViewCell.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/18/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class DoctorsTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
