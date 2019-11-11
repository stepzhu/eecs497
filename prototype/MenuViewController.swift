//
//  MenuViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 11/10/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var restaurant:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any) {
        self.performSegue(withIdentifier: "backToFoodMainSegue", sender: self)
    }
    //over
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
