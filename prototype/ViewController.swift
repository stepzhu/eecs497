//
//  ViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 10/19/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: Buttons
    
    @IBOutlet weak var stressReliefButton: UIButton!
    @IBOutlet weak var foodButton: UIButton!
    
    @IBOutlet weak var activitiesButton: UIButton!
    
    @IBOutlet weak var mapButton: UIButton!
    
    @IBOutlet weak var chatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.applyRoundCorner(stressReliefButton)
        self.applyRoundCorner(foodButton)
        self.applyRoundCorner(activitiesButton)
        self.applyRoundCorner(mapButton)
        self.applyRoundCorner(chatButton)

    }

    func applyRoundCorner(_ object:AnyObject) {
        object.layer.cornerRadius = object.frame.size.width / 2
        object.layer.masksToBounds = true
    }
    
    // MARK: Actions
    

    @IBAction func clickStressRelief(_ sender: UIButton) {
        // go to new view
        print("Button pressed")
        self.performSegue(withIdentifier: "StressReliefSegue", sender: self)
    }
    
    @IBAction func clickFood(_ sender: UIButton) {
        print("food Button pressed")
        self.performSegue(withIdentifier: "FoodSegue", sender: self)
    }
    
    
    @IBAction func clickActivities(_ sender: UIButton) {
        print("activities Button pressed")
        self.performSegue(withIdentifier: "ActivitiesSegue", sender: self)
    }
    
    @IBAction func clickMap(_ sender: UIButton) {
        print("map Button pressed")
        self.performSegue(withIdentifier: "MapSegue", sender: self)
    }
    
    @IBAction func clickChat(_ sender: UIButton) {
        print("chat Button pressed")
        self.performSegue(withIdentifier: "ChatSegue", sender: self)
    }
    
    
}

