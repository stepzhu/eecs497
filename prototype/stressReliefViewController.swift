//
//  stressReliefViewController.swift
//  prototype
//
//  Created by Izzy Koningstein on 10/19/19.
//  Copyright © 2019 Izzy Koningstein. All rights reserved.
//

import UIKit

class stressReliefViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var breathingExercisesButton: UIButton!
    @IBOutlet weak var doctorsButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK : Actions
    
    
    @IBAction func backAction(_ sender: Any) {
        self.performSegue(withIdentifier: "backSegue", sender: self)
    }
    

    @IBAction func breatheAction(_ sender: Any) {
        print("\ninsde breathe tap method\n")
        
        let newViewController = UIViewController()
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "breathe") as! UIViewController
        
        self.present(vc, animated: true, completion: nil)
        //        self.performSegue(withIdentifier: "menuSegue", sender: self)
        print(sender)
    }
    
    @IBAction func doctorAction(_ sender: Any) {
        print("\ninside doctor tap method\n")
        
        let newViewController = UIViewController()
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "doctors") as! UIViewController
        
        self.present(vc, animated: true, completion: nil)
        //        self.performSegue(withIdentifier: "menuSegue", sender: self)
        print(sender)
    }
    
    @IBAction func musicAction(_ sender: Any) {
        print("\ninsde music tap method\n")
        
        let newViewController = UIViewController()
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "music") as! UIViewController
        
        self.present(vc, animated: true, completion: nil)
        //        self.performSegue(withIdentifier: "menuSegue", sender: self)
        print(sender)
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
