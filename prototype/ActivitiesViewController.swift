//
//  ActivitiesViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 10/19/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    @IBOutlet weak var eventsYoungKidsButton: UIButton!
    
    @IBOutlet weak var eventsOlderKidsButton: UIButton!
    @IBAction func backAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "backSegue", sender: self)
    }
    
    @IBAction func clickEventsYoungKidsButton(_ sender: UIButton) {
        // go to new view
        print("Button events pressed")
        self.performSegue(withIdentifier: "showYoungKidsEvents", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
