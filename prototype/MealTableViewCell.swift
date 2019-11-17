//
//  MealTableViewCell.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/12/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit



class MealTableViewCell: UITableViewCell {
     // Mark properties
    
  
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var imageFood: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Private Methods
   
}

class MealTableViewCell2: UITableViewCell {
     // Mark properties
    
    @IBOutlet weak var FoodImageStarbucks: UIImageView!
    
    @IBOutlet weak var FoodLabelStarbucks: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Private Methods
   
}



class MealTableViewCellEinstein: UITableViewCell {
    // Mark properties
    
    @IBOutlet weak var foodImageReal: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var foodLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: Private Methods
    
    
    
    
}

